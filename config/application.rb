require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module BookStoreRg
  class Application < Rails::Application
    config.load_defaults 6.1
    config.i18n.default_locale = :en

    config.i18n.available_locales = %i[en uk]
    config.i18n.default_locale = :en

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
