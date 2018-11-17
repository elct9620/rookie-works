# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Exhibition, type: :model do
  it { should have_many(:exhibitions_projects) }
  it { should have_many(:projects).through(:exhibitions_projects) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:year) }
end
