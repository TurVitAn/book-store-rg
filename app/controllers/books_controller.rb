class BooksController < ApplicationController
  def index
    @collection = SortedBooksQuery.new(category_id: book_params[:category_id], sort_by: book_params[:sort_by]).call
    @presenter = BooksPresenter.new(book_params[:current_books_count])
    @books = @collection.limit(@presenter.calculate_limit).decorate
  end

  def show
    book.present? ? @book = book.decorate : record_not_found
  end

  private

  def book
    Book.includes(:authors).find_by(id: book_params[:id])
  end

  def book_params
    params.permit(:id, :category_id, :sort_by, :current_books_count, :locale)
  end
end
