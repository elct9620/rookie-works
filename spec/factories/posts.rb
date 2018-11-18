# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph(2) }
    user { create(:user) }

    trait :is_experience do
      category { :experience }
    end
  end
end
