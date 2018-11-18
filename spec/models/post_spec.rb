# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }

  describe '#published_at' do
    let(:post) { create(:post) }
    subject { post.update(status: :published) }

    it 'refresh when status chagned to published_at' do
      expect { post.update(status: :published) }
        .to change { post.published_at }
        .from(nil)
    end
  end

  describe 'notification' do
    let(:mailer) { double(ActionMailer::MessageDelivery) }
    subject { create(:post, :is_experience) }

    before do
      allow(mailer).to receive(:deliver_now)
      allow(ExperienceMailer).to receive(:notify_review).and_return(mailer)
      allow(ExperienceMailer).to receive(:notify_published).and_return(mailer)
    end

    it 'send to user if published' do
      expect(ExperienceMailer).to receive(:notify_published)
      subject.update(status: :published)
    end

    it 'send to admin if created' do
      expect(ExperienceMailer).to receive(:notify_review)
      subject
    end
  end
end
