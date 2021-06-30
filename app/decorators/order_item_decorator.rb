class OrderItemDecorator < ApplicationDecorator
  delegate_all
  decorates_association :book

  def subtotal_order_items_price
    quantity * book.price
  end
end
