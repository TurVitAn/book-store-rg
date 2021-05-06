module Pages
  module Admin
    module Books
      class NewBook < SitePrism::Page
        set_url('admin/books/new')

        section :fields, Sections::Admin::Books::CreateForm, '#main_content'
      end
    end
  end
end
