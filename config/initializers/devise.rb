Devise.setup do |config|
  require 'devise/orm/active_record'

  config.authentication_keys = %i[email]
  config.case_insensitive_keys = %i[email]
  config.strip_whitespace_keys = %i[email]
  config.skip_session_storage = %i[http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.email_regexp = /\A[^@.\s-](?!.*(?:''|\.\.|--))\S{1,63}[^@.\s-]@[a-zA-z]+.[a-zA-z]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.mailer_sender = Rails.application.credentials[:default_email]
  config.omniauth :facebook, Rails.application.credentials.dig(:facebook, :client).to_s,
                  Rails.application.credentials.dig(:facebook, :secret).to_s, scope: 'email,public_profile'
  config.omniauth :google_oauth2, Rails.application.credentials.dig(:google_oauth2, :client_id).to_s,
                  Rails.application.credentials.dig(:google_oauth2, :client_secret).to_s
end
