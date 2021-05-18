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
      @cart = current_user.cart || add_cart_to_user
    elsif session[:cart_id]
      @cart = Cart.find_by(id: session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    @cart = @cart.decorate
  end

  def add_cart_to_user
    session[:cart_id] = nil
    current_user.cart = Cart.create
  end

  def record_not_found
    render('layouts/errors/not_found', status: :not_found)
  end
end
