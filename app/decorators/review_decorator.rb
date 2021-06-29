class ReviewDecorator < ApplicationDecorator
  delegate_all

  def creation_date
    localize(created_at, format: I18n.t('reviews.creation_date'))
  end

  def username
    address = user.billing_address
    return user.email unless address

    "#{address.first_name} #{address.last_name}"
  end

  def first_letter_username
    username.first
  end
end
