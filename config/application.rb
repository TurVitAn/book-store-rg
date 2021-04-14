require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module BookStoreRg
  class Application < Rails::Application
    config.load_defaults 6.1

    config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.{rb,yml}')]
    config.i18n.available_locales = %i[en uk]
    config.i18n.default_locale = :en

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
