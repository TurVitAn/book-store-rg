class BookForm
  include ActiveModel::Model

  TITLE_MAX_SIZE = 100
  DESCRIPTION_MIN_SIZE = 50

  attr_accessor :title, :description, :price, :published_at, :height,
                :width, :depth, :materials, :category_id, :author_ids

  validates :category_id, :title, :description, :price, :height, :width,
            :depth, :materials, :published_at, presence: true
  validates :title, length: { maximum: TITLE_MAX_SIZE }
  validates :description, length: { minimum: DESCRIPTION_MIN_SIZE }
  validates :price, :height, :width, :depth, numericality: { greater_than_or_equal_to: 0 }
end
