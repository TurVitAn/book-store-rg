module Pages
  module Books
    class Book < SitePrism::Page
      set_url '/books/{id}'

      section :book_description, Sections::Books::BookDescription, '.container > div.row.book-description'
      section :write_review, Sections::Books::WriteReview, '.container > div.write-review'
      section :reviews, Sections::Books::Reviews, '.container > div.reviews'
    end
  end
end
