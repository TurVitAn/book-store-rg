module Pages
  module Admin
    module Categories
      class EditCategory < SitePrism::Page
        set_url('admin/categories/{id}/edit')

        section :fields, Sections::Admin::Categories::CreateForm, '#main_content'
      end
    end
  end
end
