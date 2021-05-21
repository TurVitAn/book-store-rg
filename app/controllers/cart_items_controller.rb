class CartItemsController < ApplicationController
  def create
    service = Carts::PersistItemService.new(params: cart_item_params, cart: current_cart)
    service.call
    cookies[:cart_id] = service.cart.id
    redirect_back_with_flash(t('.success'))
  end

  def update
    Carts::UpdateItemService.new(id: params[:id], quantity: cart_item_params[:quantity]).call
    redirect_back_with_flash(t('.success'))
  end

  def destroy
    service = Carts::DestroyItemService.new(item_id: params[:id], cart: current_cart)
    service.call
    cookies.delete(:cart_id) if service.cart_destroyed?
    redirect_to(carts_path, notice: t('.success'))
  end

  private

  def redirect_back_with_flash(message)
    flash.notice = message
    redirect_back(fallback_location: root_path)
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :book_id)
  end
end
