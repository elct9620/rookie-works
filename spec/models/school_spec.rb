# frozen_string_literal: true

require 'rails_helper'

RSpec.describe School, type: :model do
  it { should have_many(:schools_departments) }
  it { should have_many(:departments).through(:schools_departments) }

  it { should validate_presence_of(:name) }
end
