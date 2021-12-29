# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Rails Builtin
gem 'bcrypt', '~> 3.1.7'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4.4'
gem 'sassc-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker', '~> 5.0'

# Front-end
gem 'bootstrap_form', '~> 2.7'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'ckeditor', '~> 4.2'
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
gem 'openbox'
gem 'rails-i18n'
gem 'ransack'
gem 'sitemap_generator'
gem 'whenever', require: false

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

  # Linter
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'overcommit'
  gem 'rubocop', '~> 1.24.0', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rails'
end

group :development do
  # Rails Builtin
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'

  # Container
  gem 'boxing'

  # Console
  gem 'pry-rails'

  # Debug
  gem 'letter_opener'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
