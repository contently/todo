# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0', '>= 6.0.3.1'

gem 'audited', '~> 4.9'
gem 'bootsnap', '~> 1.4', '>= 1.4.6'
gem 'clearance'
gem 'coffee-rails', '~> 5.0'
gem 'haml-rails'
gem 'jbuilder', '~> 2.10'
gem 'puma', '~> 4.3', '>= 4.3.5'
gem 'sassc-rails', '~> 2.1', '>= 2.1.2'
gem 'sqlite3'
gem 'turbolinks', '~> 5.2', '>= 5.2.1'
gem 'uglifier', '~> 4.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'guard-rspec'
  gem 'pry-byebug'
  gem 'rspec-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2', '>= 3.2.1'
  gem 'web-console', '~> 4.0', '>= 4.0.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
end

group :test do
  gem 'capybara', '~> 3.32', '>= 3.32.2'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
