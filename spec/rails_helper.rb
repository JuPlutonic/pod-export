# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require 'spec_helper'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
# require 'capybara/poltergeist' OR 'capybara/cuprite'

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  # Capybara.javascript_driver = :poltergeist OR :headless_chrome
  Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

  config.include FactoryBot::Syntax::Methods

  # config.before(:suite) do
  #   DatabaseCleaner.clean_with(:truncation)
  # end

  # config.before(:each) do
  #   DatabaseCleaner.strategy = :transaction
  # end

  # config.before(:each, js: true) do
  #   DatabaseCleaner.strategy = :truncation
  # end

  # config.before(:each) do
  #   DatabaseCleaner.start
  # end

  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end
end
