class OrderItemsController < ApplicationController
  def create
    persist_order_items(message: t('.success'), set_cookie: true)
  end

  def update
    persist_order_items(message: t('.success'))
  end

  def destroy
    service = Orders::DestroyItemService.new(item_id: params[:id], order: current_order)
    service.call
    cookies.delete(:order_id) if service.order_destroyed?
    redirect_to(order_path, notice: t('.success'))
  end

  private

  def persist_order_items(message:, set_cookie: false)
    service = Orders::PersistItemService.new(params: order_item_params, order: current_order)
    return redirect_back_with_flash(:alert, service.errors.full_messages.to_sentence) unless service.call

    cookies[:order_id] = service.order.id if set_cookie && !current_order
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
