module Pages
  module Admin
    module Books
      class Books < SitePrism::Page
        set_url('admin/books')

        section :main_content, Sections::Admin::Books::List, '#index_table_books'
        section :filters, Sections::Admin::Books::Filters, '#filters_sidebar_section'
      end
    end
  end
end
