class CategoryForm
  include ActiveModel::Model
  include Virtus.model

  NAME_MAX_SIZE = 50

  attribute :name, String

  validates :name, presence: true, length: { maximum: NAME_MAX_SIZE }
end
