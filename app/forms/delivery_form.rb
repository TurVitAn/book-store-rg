class DeliveryForm
  include ActiveModel::Model

  attr_accessor :kind, :price, :from_days, :to_days

  validates :kind, :price, :from_days, :to_days, presence: true
  validates :from_days, :to_days, numericality: { only_integer: true }
end
