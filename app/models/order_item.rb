class OrderItem < ApplicationRecord
  INVALID_QUANTITY = 0

  belongs_to :order
  belongs_to :book

  validates :quantity, numericality: { greater_than: INVALID_QUANTITY }
end
