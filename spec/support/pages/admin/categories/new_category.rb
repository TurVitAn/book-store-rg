module Pages
  module Admin
    module Categories
      class NewCategory < SitePrism::Page
        set_url('admin/categories/new')

        section :fields, Sections::Admin::Categories::CreateForm, '#main_content'
      end
    end
  end
end
