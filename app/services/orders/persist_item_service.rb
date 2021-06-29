module Orders
  class PersistItemService
    attr_reader :order, :errors

    def initialize(params:, order:)
      @params = params
      @order = order
      @errors = []
    end

    def call
      @order ||= Order.create
      item ? update_item(item) : create_item

      errors.blank?
    end

    private

    attr_reader :params

    def item
      @item ||= order.order_items.find_by(book_id: params[:book_id])
    end

    def create_item
      order.order_items.create(params)
    end

    def update_item(item)
      return if item.update(quantity: item.quantity + params[:quantity].to_i)

      @errors << I18n.t('orders.alert.something_wrong')
    end
  end
end
