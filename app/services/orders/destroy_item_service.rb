module Orders
  class DestroyItemService
    def initialize(item_id:, order:)
      @id = item_id
      @order = order
    end

    def call
      order.order_items.find_by(id: id).delete
      order.destroy if order.order_items.blank?
    end

    delegate :destroyed?, to: :order, prefix: true

    private

    attr_reader :id, :order
  end
end
