class OrderItemsController < ApplicationController
  def create
    persist_order_items(message: t('.success'))
  end

  def update
    persist_order_items(message: t('.success'))
  end

  def destroy
    service = Orders::DestroyItemService.new(item_id: params[:id], order: current_order)
    service.call
    cookies.delete(:order_id) if service.order_destroyed?
    redirect_to(cart_path, notice: t('.success'))
  end

  private

  def persist_order_items(message:)
    service = Orders::PersistItemService.new(params: order_item_params, order: current_order)
    return redirect_back_with_flash(:alert, t('order_items.alert')) unless service.call

    cookies[:order_id] = service.order.id unless current_order
    redirect_back_with_flash(:notice, message)
  end

  def redirect_back_with_flash(flash_type, message)
    flash[flash_type] = message
    redirect_back(fallback_location: root_path)
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :book_id)
  end
end