require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module BookStoreRg
  class Application < Rails::Application
    config.load_defaults 6.1

    config.generators do |g|
      g.test_framework :rspec
    end

    config.upload_server = Rails.env.production? ? :s3 : :app
  end
end
