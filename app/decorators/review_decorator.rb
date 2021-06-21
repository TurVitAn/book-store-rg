class ReviewDecorator < ApplicationDecorator
  DEFAULT_USER_NAME = 'user'.freeze
  DATE_FORMAT = '%d/%m/%y'.freeze

  delegate_all

  def creation_date
    created_at.strftime(DATE_FORMAT)
  end

  def username
    address = user.billing_address
    return DEFAULT_USER_NAME unless address

    "#{address.first_name} #{address.last_name}"
  end

  def first_letter_username
    username.first
  end
end
