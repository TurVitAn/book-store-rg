class AuthorForm
  include ActiveModel::Model
  include Virtus.model

  NAME_MAX_SIZE = 50

  attribute :first_name, String
  attribute :last_name, String

  validates :first_name, :last_name, presence: true, length: { maximum: NAME_MAX_SIZE }
end
