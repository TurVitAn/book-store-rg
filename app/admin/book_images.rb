ActiveAdmin.register BookImage do
  permit_params :image, :book_id
  includes :book
  decorate_with BookImageDecorator

  index do
    selectable_column
    id_column
    column :book
    column :image
    actions
  end

  show do
    attributes_table do
      row :book
      row :image
    end
  end

  form do |f|
    f.inputs do
      f.input :book
      f.input :image, as: :file
    end
    actions
  end
end
