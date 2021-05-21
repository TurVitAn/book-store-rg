class OrderItemDecorator < ApplicationDecorator
  delegate_all

  decorates_association :book

  def subtotal_price
    quantity * book.price
  end
end
