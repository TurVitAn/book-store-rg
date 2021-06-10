ActiveAdmin.register Author do
  permit_params :first_name, :last_name

  actions :all, except: :show

  controller do
    def create
      @author = Author.new(permitted_params[:author])
      persist_author(:new)
    end

    def update
      @author = Author.find_by(id: permitted_params[:id])
      persist_author(:edit)
    end

    private

    def persist_author(view)
      service = Admin::PersistService.new(entity: :author, params: permitted_params)
      return redirect_to(admin_authors_path, notice: I18n.t('notice.author.saved')) if service.call

      @errors = service.errors
      render(view)
    end
  end

  remove_filter :author_books

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    actions
  end

  form partial: 'form'
end
