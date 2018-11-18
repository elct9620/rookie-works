# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Bookmarks', type: :request do
  describe 'GET /bookmarks' do
    subject { get bookmarks_path }

    it_behaves_like 'protected page'

    context 'with platform options' do
      let(:user) { create(:user) }
      let(:params) { { q: { result_of_Game_type_platform_in: %w[windows] } } }
      subject { get bookmarks_path, params: params }

      it 'returns 200' do
        sign_in user
        subject
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST /bookmarks' do
    let(:project) { create(:project) }
    subject { post bookmarks_path, params: { project_id: project.id } }

    it_behaves_like 'protected page', 302
  end

  describe 'DELETE /bookmarks/:id' do
    let(:user) { create(:user) }
    let(:bookmark) { create(:bookmark, user: user) }
    subject { delete bookmark_path(bookmark) }

    it_behaves_like 'protected page', 302
  end
end
