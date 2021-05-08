class ReviewDecorator < ApplicationDecorator
  delegate_all

  def user_logo
    user.email.first
  end

  def creation_date
    created_at.strftime('%d/%m/%y')
  end

  def username
    user.email.split(/@/).first
  end
end
