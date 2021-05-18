class Book < ApplicationRecord
  BOOKS_PER_PAGE = 12
  include ImageUploader::Attachment(:image)

  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :book_images, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :category
end
