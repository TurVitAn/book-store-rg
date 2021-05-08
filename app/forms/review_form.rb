class ReviewForm
  include ActiveModel::Model

  attr_accessor :title, :text, :rating, :book_id, :user_id

  TITLE_MAX_SIZE = 80
  TEXT_MAX_SIZE = 500
  RATING_MIN = 1
  RATING_MAX = 5
  RATING_RANGE = (RATING_MIN..RATING_MAX)

  validates :title, :text, :rating, presence: true
  validates :title, length: { maximum: TITLE_MAX_SIZE }
  validates :text, length: { maximum: TEXT_MAX_SIZE }
  validates :rating, numericality: { only_integer: true,
                                     greater_than_or_equal_to: RATING_MIN,
                                     less_than_or_equal_to: RATING_MAX }
end
