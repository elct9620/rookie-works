# frozen_string_literal: true

AdminUser.create!(email: 'admin@example.com', password: 'password') if Rails.env.development?
