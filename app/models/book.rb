class Book < ApplicationRecord
  MIN_DESCRIPTION_SIZE = 50

  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books, dependent: :destroy
  belongs_to :category

  validates :title, :description, presence: true
  validates :description, length: { minimum: MIN_DESCRIPTION_SIZE }

  scope :with_authors, -> { includes [:authors] }
end
