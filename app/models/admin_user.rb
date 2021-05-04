class AdminUser < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates :email, :password, :encrypted_password, presence: true
end
