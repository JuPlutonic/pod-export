# frozen_string_literal: true

source 'https://rubygems.org'

ruby '~> 3.1.0'
# Boot large ruby/rails apps faster (https://github.com/Shopify/bootsnap)
gem 'bootsnap'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# memoize methods invocation (https://github.com/matthewrudy/memoist
gem 'memoist', require: false
# Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/] (https://bitbucket.org/ged/ruby-pg)
gem 'pg'
# Ruby gem for dealing with proxy lists from different providers (http://github.com/nbulaj/proxy_fetcher)
gem 'proxy_fetcher'
# Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications (http://puma.io)
gem 'puma', '~> 5'
# Full-stack web application framework. (https://rubyonrails.org)
gem 'rails', '~> 7.0.0'
# Use Redis for Action Cable
gem "redis", "~> 4.0"

# Integrate Dart Sass with the asset pipeline in Rails. (https://github.com/rails/dartsass-rails)
gem "dartsass-rails", "~> 0.4.0"
# Use ESM with importmap to manage modern JavaScript in Rails without transpiling or bundling. (https://github.com/rails/importmap-rails)
gem "importmap-rails", "~> 1.1"
# Create JSON structures via a Builder-style DSL (https://github.com/rails/jbuilder)
gem 'jbuilder', '~> 2.5'
# JSON implementation for JRuby (http://json-jruby.rubyforge.org/)
gem 'json', '~> 2.3.0'
# bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '>= 0.4.0', group: :doc
# Forms made easy! (https://github.com/plataformatec/simple_form)
gem 'simple_form', '~> 5.1.0'
# # Slim templates generator for Rails 3+ (https://github.com/slim-template/slim-rails)
gem 'slim-rails'
# Sprockets Rails integration (https://github.com/rails/sprockets-rails)
gem "sprockets-rails", "~> 3.4"
# A modest JavaScript framework for the HTML you already have. (https://stimulus.hotwired.dev)
gem "stimulus-rails", "~> 1.1"
# Generic interface to multiple Ruby template engines (http://github.com/rtomayko/tilt/)
gem 'tilt', '~> 2.0.9'
# The speed of a single-page web application without having to write any JavaScript. (https://github.com/hotwired/turbo-rails)
gem "turbo-rails", "~> 1.1"
# Ruby wrapper for UglifyJS JavaScript compressor (http://github.com/lautis/uglifier)
gem 'uglifier', '~> 2.7'

group :development, :test do
  # factory_bot_rails provides integration between factory_bot and rails 4.2 or newer (https://github.com/thoughtbot/factory_bot_rails)
  gem 'factory_bot_rails'
  # Faker with Russia-specific values. INN, OGRN, etc. (http://github.com/asiniy/faker-russian)
  gem 'faker-russian'
  # Extracting `assigns` and `assert_template` from ActionDispatch. (https://github.com/rails/rails-controller-testing)
  gem 'rails-controller-testing'
  # RSpec for Rails (https://github.com/rspec/rspec-rails)
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  # Annotates Rails Models, routes, fixtures, and others based on the database schema. (http://github.com/ctran/annotate_models)
  gem 'annotate', require: false
  # Better error page for Rails and other Rack apps (https://github.com/BetterErrors/better_errors)
  # gem 'better_errors'
  # Retrieve the binding of a method's caller. Can also retrieve bindings even further up the stack. (http://github.com/banister/binding_of_caller)
  gem 'binding_of_caller'
  # Lightweight Ruby debugger (https://github.com/gsamokovarov/break)
  gem 'break'
  # Guard gem for RSpec (https://github.com/guard/guard-rspec)
  gem 'guard-rspec', require: false
  # Listen to file modifications (https://github.com/guard/listen)
  gem 'listen', '~> 3.0.5'
  # Rails plugin and log parser to help narrow down the source(s) of increased memory usage in rails application (https://github.com/noahd1/oink)
  gem 'oink'
  # rspec command for spring (https://github.com/jonleighton/spring-commands-rspec)
  gem 'spring-commands-rspec'
  # Makes spring watch files using the listen gem. (https://github.com/jonleighton/spring-watcher-listen)
  gem 'spring-watcher-listen', '~> 2.0.0'
  # `thin start --ssl`, in any ENV run `rails s thin`
  # gem 'thin'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  # A debugging tool for your Ruby on Rails applications. (https://github.com/rails/web-console)
  gem 'web-console'
end

group :test do
  # Capybara aims to simplify the process of integration testing Rack applications, such as Rails, Sinatra or Merb (https://github.com/teamcapybara/capybara)
  gem 'capybara', '~> 2.4.4'
  # Headless Chrome driver for Capybara (https://github.com/machinio/cuprite)
  # gem 'cuprite'
  # Strategies for cleaning databases.  Can be used to ensure a clean state for testing. (http://github.com/DatabaseCleaner/database_cleaner)
  gem 'database_cleaner'
  # Simple one-liner tests for common Rails functionality (https://matchers.shoulda.io/)
  gem 'shoulda-matchers'
  # Struggling to get 100% code coverage:
  # gem 'simplecov', require: false
  # gem 'simplecov-json', require: false
end
