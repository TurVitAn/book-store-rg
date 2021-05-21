module Carts
  class DestroyItemService
    def initialize(item_id:, cart:)
      @id = item_id
      @cart = cart
    end

    def call
      cart.cart_items.find_by(id: id).delete
      cart.destroy if cart.cart_items.blank?
    end

    delegate :destroyed?, to: :cart, prefix: true

    private

    attr_reader :id, :cart
  end
end
