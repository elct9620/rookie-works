# frozen_string_literal: true

FactoryBot.define do
  factory :experience, parent: :post, class: 'Experience' do
    category { :experience }
    user { create(:user) }
  end
end
