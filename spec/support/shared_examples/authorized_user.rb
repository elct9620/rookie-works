# frozen_string_literal: true

RSpec.shared_examples 'protected page' do |valid_status = :success|
  context 'before login' do
    it { should redirect_to(new_user_session_path) }
  end

  context 'after login' do
    let(:user) { create(:user) }
    before do
      sign_in user
      subject
    end

    it { expect(response).to have_http_status(valid_status) }
  end
end
