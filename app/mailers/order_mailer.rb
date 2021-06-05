class OrderMailer < ApplicationMailer
  def thank_for_order(email)
    mail(to: email, body: I18n.t('checkouts.order_mailer.thank_for_order'))
  end
end
