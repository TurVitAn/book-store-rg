Devise.setup do |config|
  require 'devise/orm/active_record'

  config.mailer_sender = Rails.application.credentials[:default_email]
  config.authentication_keys = [:email]
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.email_regexp = /\A[^@.\s-](?!.*(?:''|\.\.|--))\S{1,60}[^@.\s-]@[a-zA-z]+.[a-zA-z]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.omniauth :facebook, "#{Rails.application.credentials.dig(:facebook, :client)}", "#{Rails.application.credentials.dig(:facebook, :secret)}"
end
