class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  validates :email, :password, presence: true
  validates :confirmation_token, :reset_password_token, uniqueness: true
end
