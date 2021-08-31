# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require 'spec_helper'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
# require 'capybara/poltergeist' OR 'capybara/cuprite'

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  # Capybara.javascript_driver = :poltergeist OR :headless_chrome
  # rubocop:disable Lint/NonDeterministicRequireOrder
  Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
  # rubocop:enable Lint/NonDeterministicRequireOrder

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before do
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end

  Shoulda::Matchers.configure do |soulda_config|
    soulda_config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
