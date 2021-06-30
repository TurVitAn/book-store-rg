module Orders
  class PersistItemService
    attr_reader :order

    def initialize(params:, order:)
      @params = params
      @order = order || Order.new
    end

    def call
      item ? update_item(item) : create_item
    end

    private

    attr_reader :params

    def item
      @item ||= order.order_items.find_by(book_id: params[:book_id])
    end

    def update_item(item)
      item.quantity += params[:quantity].to_i
      item.save
    end

    def create_item
      order.order_items.build(params).save
    end
  end
end
