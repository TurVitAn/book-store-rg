module Sections
  module Books
    class BooksList < SitePrism::Section
      elements :books, '.book'
    end
  end
end
