class User < ApplicationRecord
  PASSWORD_FORMAT = /\A(?!.*\s)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/x

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2 facebook]

  validates :email, :password, :encrypted_password, presence: true
  validates :password, format: { with: PASSWORD_FORMAT }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.token = auth.credentials.token
      user.expires_at = auth.credentials.expires_at
      user.expires = auth.credentials.expires
      user.refresh_token = auth.credentials.refresh_token
      user.confirmed_at = Time.zone.now
    end
  end
end
