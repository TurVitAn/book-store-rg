class CreditCardForm
  include ActiveModel::Model
  include Virtus.model

  CARD_NUMBER_SIZE = 16
  CVV_SIZE = 3
  NAME_MAX_SIZE = 50
  NAME_REGEX = /\A[a-zA-Z\s]+\z/
  DATE_REGEX = %r{\A(0[1-9]|1[0-2])/([0-9]{2})\z}

  attribute :number, String
  attribute :cvv, String
  attribute :name, String
  attribute :date, String

  validates :number, :name, :date, :cvv, presence: true
  validates :number, length: { is: CARD_NUMBER_SIZE }, numericality: { only_integer: true }
  validates :cvv, length: { is: CVV_SIZE }, numericality: { only_integer: true }
  validates :name, length: { maximum: NAME_MAX_SIZE }, format: { with: NAME_REGEX }
  validates :date, format: { with: DATE_REGEX }
end
