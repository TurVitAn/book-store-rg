source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise', '4.7.3', github: 'heartcombo/devise', branch: 'ca-omniauth-2'
gem 'draper', '~> 4.0', '>= 4.0.1'
gem 'factory_bot_rails', '~> 6.1'
gem 'ffaker', '~> 2.18'
gem 'haml-rails', '~> 2.0', '>= 2.0.1'
gem 'jbuilder', '~> 2.7'
gem 'omniauth', '~> 1.9.1'
gem 'omniauth-facebook', '8.0.0'
gem 'omniauth-google-oauth2', '0.8.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.3'
gem 'sass-rails', '>= 6'
gem 'simple_form', '~> 5.1'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'fasterer', '~> 0.9.0'
  gem 'pry', '~> 0.14.0'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'rubocop-rails', '~> 2.9', '>= 2.9.1', require: false
  gem 'rubocop-rspec', '~> 2.2', require: false
end

group :development do
  gem 'brakeman', '~> 5.0'
  gem 'bullet', '~> 6.1', '>= 6.1.4'
  gem 'bundler-audit', '0.7.0.1'
  gem 'database_consistency', '~> 0.8.13', require: false
  gem 'haml_lint', '~> 0.37.0', require: false
  gem 'letter_opener_web', '~> 1.4'
  gem 'listen', '~> 3.3'
  gem 'overcommit', '~> 0.53.0', require: false
  gem 'spring', '2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '~> 3.35', '>= 3.35.3'
  gem 'rspec_junit_formatter', '~> 0.4.1'
  gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
  gem 'shoulda-matchers', '~> 4.5', '>= 4.5.1'
  gem 'simplecov', '~> 0.21.2', require: false
  gem 'site_prism', '~> 3.7', '>= 3.7.1'
  gem 'test-prof', '~> 1.0', '>= 1.0.2'
  gem 'webdrivers', '~> 4.6'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
