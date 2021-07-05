class HomesController < ApplicationController
  def index
    @newest_books = BookDecorator.decorate_collection(
      Book.includes(:authors).last(BookDecorator::NEWEST_BOOKS_COUNT)
    )
    @bestsellers = Books::BestsellersService.call.decorate
  end

  def privacy_policy; end
end
