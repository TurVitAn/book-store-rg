class OrderDecorator < ApplicationDecorator
  delegate_all
  decorates_association :order_items
  decorates_association :credit_card

  DEFAULT_PRICE = 0.00
  PERCENTAGE_DIVIDER = 100

  def items_count
    order_items.pluck(:quantity).sum
  end

  def subtotal_price
    order_items.map { |item| item.quantity * item.book.price }.sum
  end

  def coupon_discount
    coupon ? (subtotal_price * coupon.discount / PERCENTAGE_DIVIDER) : DEFAULT_PRICE
  end

  def delivery_price
    delivery ? delivery.price : DEFAULT_PRICE
  end

  def order_total
    subtotal_price - coupon_discount + delivery_price
  end
end
