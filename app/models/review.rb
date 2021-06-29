class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  enum status: { unprocessed: 0, approved: 1, rejected: 2 }
end
