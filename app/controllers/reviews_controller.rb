class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    service = Reviews::CreateService.new(review_params)
    service.call ? flash_review_success : flash_review_errors(service)

    redirect_back(fallback_location: books_path)
  end

  private

  def review_params
    params.require(:review).permit(:title, :text, :rating, :book_id, :user_id)
  end

  def flash_review_success
    flash[:notice] = t('.create.success')
  end

  def flash_review_errors(service)
    flash[:alert] = ReviewsPresenter.new(errors: service.errors).errors
  end
end
