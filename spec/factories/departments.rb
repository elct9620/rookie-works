# frozen_string_literal: true

FactoryBot.define do
  factory :department do
    name { Faker::Name.name }
    schools { build_list(:school, 1) }
  end
end
