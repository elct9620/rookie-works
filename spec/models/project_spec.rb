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

  describe '#video_type' do
    let(:project) { create(:project, video: video) }
    subject { project.video_type }

    context 'is YouTube' do
      let(:video) { 'https://www.youtube.com/watch?v=QBYZAZlH9cw' }
      it { should eq(:youtube) }
    end

    context 'is Vimeo' do
      let(:video) { 'https://vimeo.com/180770618' }
      it { should eq(:vimeo) }
    end
  end

  describe '#video_embed_url' do
    let(:project) { create(:project, video: video) }
    subject { project.video_embed_url }

    context 'is YouTube' do
      let(:video) { 'https://www.youtube.com/watch?v=QBYZAZlH9cw' }
      it { should eq('https://www.youtube.com/embed/QBYZAZlH9cw') }

      context 'with share link' do
        let(:video) { 'https://youtu.be/QBYZAZlH9cw' }
        it { should eq('https://www.youtube.com/embed/QBYZAZlH9cw') }
      end
    end

    context 'is Vimeo' do
      let(:video) { 'https://vimeo.com/180770618' }
      it { should eq('https://player.vimeo.com/video/180770618') }
    end
  end
end
