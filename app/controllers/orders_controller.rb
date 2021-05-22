class OrdersController < ApplicationController
  def show
    @order = current_order&.decorate
  end
end
