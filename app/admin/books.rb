ActiveAdmin.register Book do
  permit_params :title, :description, :price, :height, :width, :depth, :materials, :published_at,
                :category_id, :image, author_ids: []

  includes :category, :authors

  decorate_with BookDecorator

  controller do
    def create
      @book = Book.new(permitted_params[:book])
      persist_book(:new)
    end

    def update
      @book = Book.find_by(id: permitted_params[:id])
      persist_book(:edit)
    end

    private

    def persist_book(view)
      service = Admin::PersistService.new(entity: :book, params: permitted_params)
      return redirect_to(admin_books_path, notice: I18n.t('notice.book.saved')) if service.call

      @errors = service.errors
      render(view)
    end
  end

  preserve_default_filters!
  remove_filter :author_books
  filter :authors, as: :select, collection: proc { Author.order(:first_name).decorate }

  index do
    selectable_column
    id_column
    column :image do |book|
      if book.image_url.present?
        image_tag book.image_url, class: 'admin-image-book'
      else
        image_tag 'active_admin/default.png', class: 'admin-image-book'
      end
    end
    column :category
    column :title
    column :authors_list
    column :short_description
    column :price do |book|
      number_to_currency(book.price)
    end
    actions
  end

  show do
    attributes_table do
      row :category
      row :authors_list
      row :title
      row :description
      row :price do |book|
        number_to_currency(book.price)
      end
      row :published_at
      row :height
      row :width
      row :depth
      row :materials_list
      row :image do |book|
        if book.image_url.present?
          image_tag book.image_url, class: 'admin-image-book'
        else
          image_tag 'active_admin/default.png', class: 'admin-image-book'
        end
      end
    end
  end

  form partial: 'form'
end
