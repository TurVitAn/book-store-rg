module Orders
  class DestroyItemService
    attr_reader :errors

    def initialize(item_id:, order:)
      @id = item_id
      @order = order
      @errors = []
    end

    def call
      delete_order_item
      destroy_order

      errors.empty?
    end

    delegate :destroyed?, to: :order, prefix: true

    private

    attr_reader :id, :order

    def delete_order_item
      order_item ? order_item.delete : @errors << I18n.t('orders.alert.something_wrong')
    end

    def destroy_order
      order.destroy if order.order_items.empty?
    end

    def order_item
      @order_item ||= order.order_items.find_by(id: id)
    end
  end
end
