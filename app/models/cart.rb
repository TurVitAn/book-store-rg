class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_one :coupon, dependent: :destroy
end
