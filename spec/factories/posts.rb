# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph(sentence_count: 2) }

    trait :published do
      status { :published }
    end
  end
end
