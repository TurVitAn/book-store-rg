class CartItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
