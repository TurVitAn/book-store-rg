class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  protect_from_forgery

  before_action :categories, :cart

  private

  def categories
    @categories ||= Category.all
  end

  def cart
    if user_signed_in?
      @cart = current_user.cart || current_user.create_cart
    elsif cookies[:cart_id]
      @cart = Cart.find_by(id: cookies[:cart_id])
    else
      @cart = Cart.create
      cookies[:cart_id] = @cart.id
    end
    @cart = @cart.decorate
  end

  def record_not_found
    render('layouts/errors/not_found', status: :not_found)
  end
end
