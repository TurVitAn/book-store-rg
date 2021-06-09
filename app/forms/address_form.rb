class AddressForm
  include ActiveModel::Model

  ADDRESS_MAX_SIZE = 50
  NAME_MAX_SIZE = 50
  PHONE_MAX_SIZE = 15
  ZIP_MAX_SIZE = 10

  VALIDATE_ADDRESS = /\A[a-zA-z0-9,\-\s]+\z/
  VALIDATE_NAME = /\A[a-zA-z\s]+\z/
  VALIDATE_PHONE = /\A\+[0-9]+\z/
  VALIDATE_ZIP = /\A[0-9-]+\z/

  attr_accessor :first_name, :last_name, :address, :city, :zip_code, :country, :phone, :address_type

  validates :first_name, :last_name, :address, :city, :zip_code, :country, :phone, presence: true
  validates :first_name, :last_name, :country, :city,
            length: { maximum: NAME_MAX_SIZE }, format: { with: VALIDATE_NAME,
                                                          message: I18n.t('addresses.validation.names_format') }
  validates :address, length: { maximum: ADDRESS_MAX_SIZE },
                      format: { with: VALIDATE_ADDRESS,
                                message: I18n.t('addresses.validation.address_format') }
  validates :phone, length: { maximum: PHONE_MAX_SIZE },
                    format: { with: VALIDATE_PHONE,
                              message: I18n.t('addresses.validation.phone_format') }
  validates :zip_code, length: { maximum: ZIP_MAX_SIZE },
                       format: { with: VALIDATE_ZIP,
                                 message: I18n.t('addresses.validation.zip_format') }

  validate :country_selected_from_list, unless: -> { country.blank? }
  validate :country_code_of_phone, unless: -> { phone.blank? }

  private

  def country_selected_from_list
    errors.add(:country, :invalid) unless selected_country
  end

  def country_code_of_phone
    return if country.present? && phone.include?(selected_country.country_code)

    errors.add(:phone, I18n.t('addresses.validation.phone_country_code'))
  end

  def selected_country
    ISO3166::Country.find_country_by_name(country)
  end
end
