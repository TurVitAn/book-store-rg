class HomesController < ApplicationController
  def index
    @newest_books = BookDecorator.decorate_collection(
      Book.includes(:authors).last(BookDecorator::NEWEST_BOOKS_COUNT)
    )
  end

  def checkout_login
    redirect_to(checkout_index_path) if current_user.present?
  end

  def privacy_policy; end
end
