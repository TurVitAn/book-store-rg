class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2 facebook]

  validates :email, :password, presence: true
  validates :confirmation_token, :reset_password_token, uniqueness: true

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    user ||= User.create(
      email: data['email'],
      password: Devise.friendly_token[0, 20]
    )

    user.name = access_token.info.name
    user.image = access_token.info.image
    user.provider = access_token.provider
    user.uid = access_token.uid
    user.token = access_token.credentials.token
    user.expires_at = access_token.credentials.expires_at
    user.expires = access_token.credentials.expires
    user.refresh_token = access_token.credentials.refresh_token
    user.confirmed_at = Time.now # autoconfirm user from omniauth

    user
  end

  def to_s
    email
  end
end
