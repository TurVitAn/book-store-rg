module Pages
  module Admin
    module Authors
      class NewAuthor < SitePrism::Page
        set_url('admin/authors/new')

        section :fields, Sections::Admin::Authors::CreateForm, '#main_content'
      end
    end
  end
end
