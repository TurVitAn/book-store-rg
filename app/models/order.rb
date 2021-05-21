class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_one :coupon, dependent: :nullify
  has_many :order_items, dependent: :destroy
end
