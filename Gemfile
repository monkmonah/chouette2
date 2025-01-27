source 'https://rubygems.org'

gem 'bundler', '~> 2.3.22'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.0'

gem "passenger", ">= 5.0.25", require: "phusion_passenger/rack_handler"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 4.2.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 5.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.5.0' # Update to v4 for Rails 4.2
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 2.6.0', group: :doc
# psych 4 is incompatible with Ruby < 3.1
gem 'psych', '< 4.0.0', group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring', '~> 4.1.0', group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# API Rest
gem 'sawyer', '~> 0.9.0'
gem 'faraday_middleware', '~> 1.2.0'

gem 'figaro', '~> 1.2.0'

platforms :ruby do
  gem 'mini_racer', '~> 0.6.3'
  gem 'pg', '~> 1.4.0'
  gem 'sqlite3'
end

gem 'activerecord-postgis-adapter', '>=  6.0.0'
gem 'polylines'

# Authentication
gem 'devise', '~>  4.8.1'
gem 'devise-encryptable'
gem 'devise_invitable'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth_openid_connect', '~> 0.6.0'
gem 'json-jwt', '~>1.11.0'

# Map, Geolocalization
gem 'map_layers', '0.0.5'
gem 'rgeo', '~> 1.1.0'
gem 'georuby-ext', git: 'https://github.com/entur/georuby-ext.git', branch: 'master'
gem 'georuby', '2.3.0' # Fix version for georuby-ext because api has changed
gem 'ffi', '~> 1.15.5'
gem 'ffi-proj4', git: 'https://github.com/entur/ffi-proj4', branch: 'master'

gem 'mimemagic'

# User interface
gem 'language_engine', git: 'https://github.com/entur/language_engine'
gem 'calendar_helper', '0.2.6'
gem 'cocoon'
gem 'formtastic', '4.0.0'
gem 'RedCloth'
gem 'simple_form', '~> 5.2.0'
gem 'font-awesome-sass', '~> 4.2.0'
#gem 'will_paginate-bootstrap', '~> 1.0.1'
gem 'breadcrumbs_on_rails'

# Format Output
gem 'json'
gem 'rubyzip', '~> 2.3.0'
gem 'roo'

# Controller
gem 'inherited_resources'
gem 'google-analytics-rails', '~> 1.1.0'

# Model
gem 'ransack', '~> 2.1'

#gem 'squeel'
gem 'baby_squeel', '>= 1.4.4'

gem 'kaminari', '~> 1.2.2'
gem 'bootstrap-kaminari-views', '~> 0.0.5'
gem 'kaminari-i18n', '~> 0.5.0'

gem 'enumerize', '~>  2.5.0'
#gem 'foreigner', '~> 1.7.4'
gem 'deep_cloneable', '~> 3.2.0'
gem 'acts-as-taggable-on', '~> 8.1.0'

gem 'acts_as_list', '~> 1.0.4'
gem 'acts_as_tree', '~> 2.9.0', require: 'acts_as_tree'

gem 'rabl'

gem 'delayed_job_active_record'
gem 'devise-async', '~>  1.0.0'
gem 'ros-apartment', require: 'apartment'

gem 'newrelic_rpm'
gem 'letter_opener'

gem 'migration_data'

gem 'responders', '~> 3.0'

gem 'pundit'

group :development do
  gem 'capistrano', '~> 3.17.0'
  gem 'capistrano-ext'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rspec', '~> 3.12.0'
  gem 'rails-erd'
  # MetaRequest is incompatible with rgeo-activerecord
  # gem 'meta_request'
  #gem 'quiet_assets', '~> 1.1.0'
  gem 'simplecov', '~> 0.22.0'
  gem 'web-console', '~> 3.7.0'
  platforms :ruby_27 do
    #gem 'better_errors'
    gem 'binding_of_caller'
  end
end

group :test, :development do
  gem 'pry-rails'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'fakeweb', git: 'https://github.com/chrisk/fakeweb.git', ref: '2b08c1ff2714ec13a12f3497d67fcefce95c2cbe'
  gem 'capybara', '~> 3.39.0'
  gem 'poltergeist'
  gem 'launchy'
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'rb-inotify', require: RUBY_PLATFORM.include?('linux') && 'rb-inotify'
  gem 'rb-fsevent', require: RUBY_PLATFORM.include?('darwin') && 'rb-fsevent'
  gem 'transpec', git: 'https://github.com/NielsKSchjoedt/transpec.git', ref: '633d4af678e0b463d5928628f9f68701bdbcb1fa'
  gem 'database_cleaner', '~>  2.0.1'
  gem 'shoulda-matchers', '~>  5.3.0'
  gem 'rspec_junit_formatter'
  gem 'rails-controller-testing'
end

group :production do
  gem 'SyslogLogger', require: 'syslog/logger'
  gem 'daemons'
end


# IEVKIT
gem 'ievkit',  git: 'https://github.com/entur/ievkit.git', branch: 'master' #'~> 0.5.0'
gem 'ievkit_views', git: 'https://github.com/entur/ievkit_views.git', branch: 'master' #'~> 0.5.0'

# I18n
gem 'rails-i18n', '~> 6.0.0'
gem 'devise-i18n'
gem 'chouette2-i18n', git: 'https://github.com/entur/chouette2-i18n.git', :branch => 'master'
gem 'chouette-projects-i18n', git: 'https://github.com/entur/chouette-projects-i18n.git', :branch => 'master'

# Rails Assets
source 'https://rails-assets.org' do
  gem 'rails-assets-morrisjs', '~> 0.5.1'
  gem 'rails-assets-raphael', '~> 2.1.3'
  gem 'rails-assets-footable', '~> 2.0.3'

  # Use twitter bootstrap resources
  gem 'rails-assets-bootstrap-sass-official', '~> 3.3.7'
  gem 'rails-assets-tagmanager', '~> 3.0.0'
  gem 'rails-assets-typeahead.js', '~> 0.10.5'
  gem 'rails-assets-typeahead.js-bootstrap3.less'
  gem 'rails-assets-respond'
  gem 'rails-assets-eonasdan-bootstrap-datetimepicker', '~> 3.1.4'
  gem 'rails-assets-jquery-tokeninput', '~> 1.7.0'

  gem 'rails-assets-modernizr', '~> 2.0.6'
  gem 'rails-assets-jquery-ui', '~> 1.11.4'
end
