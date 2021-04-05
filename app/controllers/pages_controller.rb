class PagesController < ApplicationController
  def index
    @newest_books = BookDecorator.decorate_collection(
      Book.includes(:authors).last(BookDecorator::NEWEST_BOOKS_COUNT)
    )
  end
end
