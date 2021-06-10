ActiveAdmin.register Category do
  permit_params :name

  actions :all, except: :show

  controller { skip_before_action :categories }

  filter :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end
end
