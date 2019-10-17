source 'https://rubygems.org'

ruby '2.4.9'
# Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications (http://puma.io)
gem 'puma', '~> 3'
# Full-stack web application framework. (https://rubyonrails.org)
gem 'rails', '>= 5.0.2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# CoffeeScript adapter for the Rails asset pipeline. (https://github.com/rails/coffee-rails)
gem 'coffee-rails', '~> 4.2'
# an asset gemification of the font-awesome icon font library (https://github.com/bokmann/font-awesome-rails)
gem 'font-awesome-rails'
# Create JSON structures via a Builder-style DSL (https://github.com/rails/jbuilder)
gem 'jbuilder', '~> 2.5'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jQuery with Rails 4+ (https://github.com/rails/jquery-rails)
gem 'jquery-rails'
# JSON implementation for JRuby (http://json-jruby.rubyforge.org/)
gem 'json', '2.0.2'
# Sass adapter for the Rails asset pipeline. (https://github.com/rails/sass-rails)
gem 'sass-rails', '~> 5.0'
# gem 'sdoc', '>= 0.4.0', group: :doc
# # Slim templates generator for Rails 3+ (https://github.com/slim-template/slim-rails)
gem 'slim-rails'
# Generic interface to multiple Ruby template engines (http://github.com/rtomayko/tilt/)
gem 'tilt', '=2.0.9'
# Turbolinks makes navigating your web application faster (https://github.com/turbolinks/turbolinks)
gem 'turbolinks', '~> 5'
# Ruby wrapper for UglifyJS JavaScript compressor (http://github.com/lautis/uglifier)
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  # RSpec for Rails (https://github.com/rspec/rspec-rails)
  gem 'rspec-rails', '~> 3.5'
  # gem 'selenium-webdriver'
end

group :development do
  # Annotates Rails Models, routes, fixtures, and others based on the database schema. (http://github.com/ctran/annotate_models)
  gem 'annotate', require: false

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # Ruby fast debugger - base + CLI (http://github.com/deivid-rodriguez/byebug)
  gem 'byebug', platform: :mri
  # Listen to file modifications (https://github.com/guard/listen)
  gem 'listen', '~> 3.0.5'
  # gem 'oink'
  # Struggling to get 100% code coverage:
  # gem 'simplecov', require: false
  # gem 'simplecov-json', require: false
  # Automatic Ruby code style checking tool. (http://github.com/bbatsov/rubocop)
  gem 'rubocop', require: false
  # Automatic performance checking tool for Ruby code. (https://github.com/rubocop-hq/rubocop-performance)
  gem 'rubocop-performance', require: false
  # Automatic Rails code style checking tool. (https://github.com/rubocop-hq/rubocop-rails)
  gem 'rubocop-rails', require: false
  # Code style checking for RSpec files (https://github.com/rubocop-hq/rubocop-rspec)
  gem 'rubocop-rspec', '~> 1.25.0', require: false
  # Rails application preloader (https://github.com/rails/spring)
  gem 'spring'
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
  # # Auto-install phantomjs on demand for current platform. Comes with poltergeist integration. (https://github.com/colszowka/phantomjs-gem)
  # gem 'phantomjs', '~> 2', require: 'phantomjs/poltergeist'
  # # PhantomJS driver for Capybara (https://github.com/teampoltergeist/poltergeist)
  # gem 'poltergeist', '~> 1.6.0'
end

# Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/] (https://bitbucket.org/ged/ruby-pg)
gem 'pg'
