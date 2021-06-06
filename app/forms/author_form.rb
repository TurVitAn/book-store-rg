class AuthorForm
  include ActiveModel::Model

  NAME_MAX_SIZE = 50

  attr_accessor :first_name, :last_name

  validates :first_name, :last_name, presence: true, length: { maximum: NAME_MAX_SIZE }
end
