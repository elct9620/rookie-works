# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /' do
    subject { get root_path }

    it 'returns 200' do
      subject
      expect(response).to have_http_status(200)
    end

    context 'with platform options' do
      let(:params) { { q: { result_of_Game_type_platform_in: %w[windows] } } }
      subject { get root_path, params: params }

      it 'returns 200' do
        subject
        expect(response).to have_http_status(200)
      end
    end
  end
end
