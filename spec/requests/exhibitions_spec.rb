# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Exhibitions', type: :request do
  describe 'GET /exhibitions/:id' do
    let(:exhibition) { create(:exhibition) }
    subject { get exhibition_path(exhibition) }

    it 'returns 200' do
      subject
      expect(response).to have_http_status(200)
    end
  end
end
