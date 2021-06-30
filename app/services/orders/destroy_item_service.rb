module Orders
  class DestroyItemService
    ITEMS_COUNT_TO_DESTROY_ORDER = 1

    def initialize(item_id:, order:)
      @id = item_id
      @order = order
    end

    def call
      return order.destroy if order.order_items.count == ITEMS_COUNT_TO_DESTROY_ORDER

      order_item.destroy
    end

    delegate :destroyed?, to: :order, prefix: true

    private

    attr_reader :id, :order

    def order_item
      @order_item ||= order.order_items.find(id)
    end
  end
end
