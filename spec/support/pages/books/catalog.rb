module Pages
  module Books
    class Catalog < SitePrism::Page
      set_url '/books'

      section :sorting, Sections::Books::Sorting, '.container > div.clearfix'
      section :books_list, Sections::Books::BooksList, '.container > div.books-list'
    end
  end
end
