class User < ApplicationRecord
  PASSWORD_FORMAT = /\A(?!.*\s)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/x

  has_one :billing_address, -> { where(address_type: Address.address_types[:billing]) },
          class_name: 'Address', as: :addressable, dependent: :destroy, inverse_of: :addressable
  has_one :shipping_address, -> { where(address_type: Address.address_types[:shipping]) },
          class_name: 'Address', as: :addressable, dependent: :destroy, inverse_of: :addressable
  has_many :carts, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :email, :password, :encrypted_password, presence: true
  validates :password, format: { with: PASSWORD_FORMAT }

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2 facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end
end
