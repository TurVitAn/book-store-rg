class OrderItemsController < ApplicationController
  def create
    service = Orders::PersistItemService.new(params: order_item_params, order: current_order)
    return redirect_back_with_flash(:alert, service.errors.to_sentence) unless service.call

    cookies[:order_id] = service.order.id
    redirect_back_with_flash(:notice, t('.success'))
  end

  def update
    service = Orders::UpdateItemService.new(id: params[:id], params: order_item_params)
    return redirect_back_with_flash(:alert, service.errors.to_sentence) unless service.call

    redirect_back_with_flash(:notice, t('.success'))
  end

  def destroy
    service = Orders::DestroyItemService.new(item_id: params[:id], order: current_order)
    return redirect_back_with_flash(:alert, service.errors.to_sentence) unless service.call

    cookies.delete(:order_id) if service.order_destroyed?
    redirect_to(orders_path, notice: t('.success'))
  end

  private

  def redirect_back_with_flash(flash_type, message)
    flash[flash_type] = message
    redirect_back(fallback_location: root_path)
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :increment, :decrement, :book_id)
  end
end
