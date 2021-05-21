class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  protect_from_forgery

  before_action :categories, :header_presenter, :current_cart

  private

  def categories
    @categories ||= Category.all
  end

  def header_presenter
    @header_presenter = HeaderPresenter.new(cart: current_cart)
  end

  def current_cart
    Cart.find_by(id: cookies[:cart_id])&.decorate
  end

  def record_not_found
    render('layouts/errors/not_found', status: :not_found)
  end
end
