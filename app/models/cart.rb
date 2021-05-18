class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_one :coupon, dependent: :destroy
  has_many :cart_items, dependent: :destroy
end
