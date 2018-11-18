# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Exhibition, type: :model do
  it { should have_many(:exhibitions_projects) }
  it { should have_many(:projects).through(:exhibitions_projects) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:year) }

  describe '#name_with_year' do
    let(:name) { '放視大賞' }
    let(:year) { 2018 }
    let(:exhibition) { create(:exhibition, name: name, year: year) }
    subject { exhibition.name_with_year }

    it { should eq("#{year} - #{name}") }
  end
end
