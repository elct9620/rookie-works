# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:projects) }
  it { should have_many(:games) }
  it { should have_many(:posts) }
  it { should have_many(:bookmarks) }

  describe '#display_name' do
    let(:display_name) { nil }
    let(:email) { 'user@example.com' }
    let(:user) { create(:user, email: email, display_name: display_name) }
    subject { user.display_name }

    it 'return email if not configured' do
      should eq('user')
    end

    context 'is configured' do
      let(:display_name) { 'Example' }

      it 'return user name' do
        should eq(display_name)
      end
    end
  end

  describe '#avatar_url' do
    let(:email) { 'user@example.com' }
    let(:hash) { Digest::MD5.hexdigest(email) }
    let(:user) { create(:user, email: email) }
    subject { user.avatar_url }

    it { should eq("https://www.gravatar.com/avatar/#{hash}?s=100") }

    context 'avatar size is specified' do
      let(:size) { 150 }
      subject { user.avatar_url(size) }

      it { should eq("https://www.gravatar.com/avatar/#{hash}?s=#{size}") }
    end
  end
end
