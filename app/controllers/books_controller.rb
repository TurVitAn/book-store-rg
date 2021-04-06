class BooksController < ApplicationController
  def index
    @pagy, books = pagy(Book.includes(:authors).all.order(title: :asc))
    @books = BookDecorator.decorate_collection(books)
    @categories = Category.all
  end

  def show
    @book = Book.includes(:authors).find(params[:id]).decorate
  end
end
