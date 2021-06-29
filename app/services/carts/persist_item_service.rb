module Carts
  class PersistItemService
    def initialize(params:, cart:)
      @params = params
      @cart = cart
    end

    def call
      item = find_item
      item ? update_item(item) : create_item
    end

    private

    attr_reader :params, :cart

    def find_item
      cart.cart_items.find_by(book_id: params[:book_id])
    end

    def create_item
      cart.cart_items.create(params)
    end

    def update_item(item)
      item.quantity += params[:quantity].to_i
      item.save
    end
  end
end
