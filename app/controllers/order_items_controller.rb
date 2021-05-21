class OrderItemsController < ApplicationController
  def create
    service = Orders::PersistItemService.new(params: order_item_params, order: current_order)
    service.call
    cookies[:order_id] = service.order.id
    redirect_back_with_flash(t('.success'))
  end

  def update
    Orders::UpdateItemService.new(id: params[:id], quantity: order_item_params[:quantity]).call
    redirect_back_with_flash(t('.success'))
  end

  def destroy
    service = Orders::DestroyItemService.new(item_id: params[:id], order: current_order)
    service.call
    cookies.delete(:order_id) if service.order_destroyed?
    redirect_to(orders_path, notice: t('.success'))
  end

  private

  def redirect_back_with_flash(message)
    flash.notice = message
    redirect_back(fallback_location: root_path)
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :book_id)
  end
end
