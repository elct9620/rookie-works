# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Experiences', type: :request do
  let(:experience) { create(:experience) }

  describe 'GET /experiences' do
    subject { get experiences_path }

    it 'returns 200' do
      subject
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /experiences/:id' do
    let(:experience) { create(:experience, :published) }
    subject { get experience_path(experience) }

    it 'returns 200' do
      subject
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /experiences/new' do
    subject { get new_experience_path }

    it_behaves_like 'protected page'
  end

  describe 'POST /experiences' do
    let(:params) { attributes_for(:experience) }
    subject { post experiences_path, params: { post: params } }

    it_behaves_like 'protected page', 302

    context 'has invalid params' do
      let(:params) { { title: '' } }

      it_behaves_like 'protected page', 200
    end
  end

  describe 'GET /experiences/:id/edit' do
    let(:user) { create(:user) }
    let(:experience) { create(:experience, user: user) }
    subject { get edit_experience_path(experience) }

    it_behaves_like 'protected page'
  end

  describe 'PUT /experiences/edit' do
    let(:user) { create(:user) }
    let(:experience) { create(:experience, user: user) }
    let(:params) { { title: 'New Title' } }
    subject { put experience_path(experience), params: { post: params } }

    it_behaves_like 'protected page', 302

    context 'has invalid params' do
      let(:params) { { title: '' } }

      it_behaves_like 'protected page', 200
    end
  end

  it_behaves_like 'has comments on', Experience
end
