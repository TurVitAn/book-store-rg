module Pages
  module Admin
    module Authors
      class EditAuthor < SitePrism::Page
        set_url('admin/authors/{id}/edit')

        section :fields, Sections::Admin::Authors::CreateForm, '#main_content'
      end
    end
  end
end
