module Pages
  module Admin
    module Books
      class EditBook < SitePrism::Page
        set_url('admin/books/{id}/edit')

        section :fields, Sections::Admin::Books::CreateForm, '#main_content'
      end
    end
  end
end
