# frozen_string_literal: true

RSpec.shared_examples 'has comments on' do |model|
  let(:resource) { create(model.model_name.singular) }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "POST /#{model.model_name.plural}/:id/comments" do
    let(:resource_name) { resource.model_name }
    let(:path) { polymorphic_path([resource_name.singular.to_sym, :comments], "#{resource_name.singular}_id": resource.id) }
    let(:params) { { content: Faker::Lorem.paragraph } }

    it do
      post path, params: { comment: params }
      expect(response).to_not redirect_to(polymorphic_path(resource_name.singular, id: resource.id, anchor: 'comment-form'))
    end
  end
end
