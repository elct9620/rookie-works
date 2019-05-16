# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Rails Builtin
gem 'bcrypt', '~> 3.1.7'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.5'
gem 'sassc-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

# Front-end
gem 'bootstrap-sass', '~> 3.4.1'
gem 'bootstrap_form', '~> 2.7'
gem 'ckeditor'
gem 'jquery-rails'
gem 'select2-rails', '~> 4.0.3'
gem 'slim-rails'

# Assets
gem 'carrierwave'
gem 'mini_magick'

# Authenticate
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'

# Admin
gem 'activeadmin'

# SEO
gem 'meta-tags'

# Misc
gem 'dotenv-rails'
gem 'kaminari'
gem 'rails-i18n'
gem 'ransack'
gem 'rollbar', '~> 2.15.0'
gem 'sitemap_generator'
gem 'whenever', require: false

group :production do
  gem 'passenger', '~> 5.2.1'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # Test
  gem 'database_rewinder'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'shoulda', require: false
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
end

group :development do
  # Rails Builtin
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'

  # Checker
  gem 'brakeman'
  gem 'bundler-audit', '~> 0.6.0'
  gem 'overcommit'
  gem 'rubocop', '~> 0.60.0'

  # Console
  gem 'pry-rails'

  # Deployment
  gem 'capistrano-passenger'
  gem 'capistrano-rails'
  gem 'capistrano-upload-config'

  # Debug
  gem 'letter_opener'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
