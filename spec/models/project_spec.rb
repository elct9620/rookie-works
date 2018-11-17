# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:department) { create(:department) }
  subject { build(:project, school: department.schools.first) }

  it { should belong_to(:department) }
  it { should belong_to(:school) }
  it { should belong_to(:user) }
  it { should belong_to(:result) }
  it { should have_many(:exhibitions_projects) }
  it { should have_many(:exhibitions).through(:exhibitions_projects) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:thumbnail) }

  pending 'validates video format'
  pending 'validates department'
end
