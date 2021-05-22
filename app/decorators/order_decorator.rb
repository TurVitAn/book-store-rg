class OrderDecorator < ApplicationDecorator
  DEFAULT_DISCOUNT = 0.00
  DIVIDER = 100

  delegate_all
  decorates_association :order_items

  def items_count
    order_items.map(&:quantity).sum
  end

  def order_total
    subtotal_price - coupon_discount
  end

  def subtotal_price
    order_items.map { |item| item.quantity * item.book.price }.sum
  end

  def coupon_discount
    coupon ? (subtotal_price * coupon.discount / DIVIDER) : DEFAULT_DISCOUNT
  end
end
