# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internal.email }
    password { Devise.friendly_token[6..12] }
  end
end
