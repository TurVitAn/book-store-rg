class CategoryForm
  include ActiveModel::Model

  NAME_MAX_SIZE = 50

  attr_accessor :name

  validates :name, presence: true, length: { maximum: NAME_MAX_SIZE }
end
