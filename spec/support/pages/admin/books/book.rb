module Pages
  module Admin
    module Books
      class Book < SitePrism::Page
        set_url('admin/books/{id}')

        section :book_details, Sections::Admin::Books::Details, '#main_content'
      end
    end
  end
end
