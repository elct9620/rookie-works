# frozen_string_literal: true

FactoryBot.define do
  factory :exhibition do
    name { Faker::Name.name }
    year { Random.rand(2000..2020) }
  end
end
