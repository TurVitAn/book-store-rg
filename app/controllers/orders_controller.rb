class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = SortedOrdersQuery.new(relation: current_user.orders, sort_by: orders_params[:sort_by]).call.decorate
    @orders_presenter = OrdersPresenter.new
  end

  def show
    @order = Order.includes(order_items: [:book]).find(params[:id]).decorate
  end

  private

  def orders_params
    params.permit(:sort_by)
  end
end
