source 'https://rubygems.org'

gem 'rails', '4.2.3'
gem 'rack-contrib'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'therubyracer'

# UI/UX
gem 'sprockets-es6', require: 'sprockets/es6'
gem 'jquery-rails'
gem 'react-rails'
gem 'bootstrap-sass'
gem 'bootstrap-material-design'
gem 'font-awesome-rails'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
gem 'sass-rails'
gem 'slim-rails'
gem 'jbuilder', '~> 2.0'
gem 'rails-i18n', '~> 4.0.0'
gem 'responders'

# Configuration
gem 'dotenv-rails'
gem 'config', '~> 1.0.0'

# Database
gem 'pg'
gem 'redis-rails'
gem 'dalli'

# Seeds
gem 'seed-fu'

# Breadcrumbs
gem 'gretel'

# Form
gem 'simple_form'
gem 'nested_form'

# Soft delete
gem 'paranoia', '~> 2.0'

# Model
gem 'active_hash'
gem 'virtus'

# Decorator
gem 'draper'

# Analytics
gem 'google-analytics-turbolinks'

# Application server
gem 'unicorn'
gem 'unicorn-rails'
gem 'unicorn-worker-killer'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3'

  # CLI
  gem 'spring'
  gem 'spring-commands-rspec'

  # Test
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'simplecov', require: false
  gem 'faker'
  gem 'timecop'

  # Code analyze
  gem 'rubocop'
  gem 'reek', '~> 3.3.0'
  gem 'rails_best_practices'
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'coffeelint'
  gem 'scss-lint'

  # Debugger
  gem 'byebug'
  gem 'better_errors'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'web-console', '~> 2.0'

  # Logging
  gem 'quiet_assets'

  # Print debug
  gem 'awesome_print'
  gem 'tapp'

  # Table/Schema
  gem 'annotate'
  gem 'migration_comments'

  # Deploy
  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano3-unicorn'
  gem 'capistrano3-delayed-job'
end
