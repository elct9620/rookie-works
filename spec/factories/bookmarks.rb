# frozen_string_literal: true

FactoryBot.define do
  factory :bookmark do
    project { create(:project) }
    user { create(:user) }
  end
end
