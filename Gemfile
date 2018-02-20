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
gem 'bootstrap-sass', '~> 3.3.7'
gem 'bootstrap_form', '~> 2.7'
gem 'slim-rails'

# Assets
gem 'carrierwave'

# Authenticate
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'

# Deployment
gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # Test
  gem 'factory_bot'
  gem 'faker'
  gem 'rspec-rails'
end

group :development do
  # Rails Builtin
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'

  # Checker
  gem 'brakeman'
  gem 'overcommit'
  gem 'rubocop', '~> 0.52.1'

  # Console
  gem 'pry-rails'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
