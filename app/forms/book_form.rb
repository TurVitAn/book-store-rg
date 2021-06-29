class BookForm
  include ActiveModel::Model
  include Virtus.model

  TITLE_MAX_SIZE = 100
  DESCRIPTION_MIN_SIZE = 50

  attribute :title, String
  attribute :description, String
  attribute :price, Float
  attribute :height, Float
  attribute :width, Float
  attribute :depth, Float
  attribute :materials, String
  attribute :published_at, Date
  attribute :category_id, Integer
  attribute :author_ids, Integer

  validates :category_id, :title, :description, :price, :height, :width,
            :depth, :materials, :published_at, presence: true
  validates :title, length: { maximum: TITLE_MAX_SIZE }
  validates :description, length: { minimum: DESCRIPTION_MIN_SIZE }
  validates :price, :height, :width, :depth, numericality: { greater_than_or_equal_to: 0 }
end
