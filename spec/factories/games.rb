# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    genre { :unknown }
    platform { [:windows] }
  end
end
