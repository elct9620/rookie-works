# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Home', type: :feature, js: true do
  describe 'Visual testing' do
    it 'loads homepage' do
      visit root_path
      Percy.snapshot(page, name: 'Home Page')
    end
  end
end
