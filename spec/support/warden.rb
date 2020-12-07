# frozen_string_literal: true

require 'capybara/rspec'
require 'capybara/rails'

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = false

  config.include FactoryBot::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.include Capybara::DSL
  config.include Warden::Test::Helpers
  config.include Rails.application.routes.url_helpers

  Warden.test_mode!

  config.after(:each) do
    Warden.test_reset!
  end
end
