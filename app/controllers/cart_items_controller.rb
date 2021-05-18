class CartItemsController < ApplicationController
  def create
    Carts::ItemService.new(cart_item_params).call
    redirect_back(fallback_location: root_path)
  end

  def destroy
    CartItem.find_by(id: params[:id]).destroy
    redirect_to(cart_path, notice: t('.success'))
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :book_id).merge(cart_id: @cart.id)
  end
end
