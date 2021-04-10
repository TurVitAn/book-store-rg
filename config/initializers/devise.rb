Devise.setup do |config|
  # config.secret_key = '5d321f32bfe8ab8b292e4ef9cd0a6e6cf00481738879451404aab8bcaacbf450da948b9a5adf6ed5059097fa00adbc
  # acbfb1c9a0d19530a9e2e1e4aa8ca9cf39'

  # Set up a pepper to generate the hashed password.
  # config.pepper = '9842398527ecc316df55bbff391268fcb95b696a50d04bda0b593963931a40b4540a715709d8e73a259cd9049177be325e
  # 8c86f3e0446f26037d7f3cee277cb1'

  config.mailer_sender = 'bookstore.rg.turvitan@gmail.com'
  # config.mailer = 'Devise::Mailer'
  # config.parent_mailer = 'ActionMailer::Base'

  require 'devise/orm/active_record'

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

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'
end
