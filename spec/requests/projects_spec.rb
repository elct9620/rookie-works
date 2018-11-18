# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Projects', type: :request do
  describe 'GET /projects' do
    subject { get projects_path }
    it_behaves_like 'protected page'
  end

  describe 'GET /projects/:id' do
    let(:project) { create(:project) }
    subject { get project_path(project) }

    it 'returns 200' do
      subject
      expect(response).to have_http_status(200)
    end
  end
end
