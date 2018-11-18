# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    department { create(:department, schools: [school]) }
    school { create(:school) }
    user { create(:user) }
    result { create(:game) }
    thumbnail do
      Rack::Test::UploadedFile.new(
        Rails.root.join('spec', 'support', 'images', 'project', 'thumbnail.jpg'),
        'image/jpeg'
      )
    end

    trait :is_game do
      result { create(:game) }
    end
  end
end
