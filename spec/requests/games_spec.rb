# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Games', type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, :is_game, user: user) }
  let(:game) { project.result }

  describe 'GET /games/new' do
    subject { get new_game_path }

    it_behaves_like 'protected page'
  end

  describe 'POST /games' do
    # TODO: Improve project attributes
    let(:department) { create(:department) }
    let(:project_attributes) do
      attributes_for(:project).tap do |project|
        project[:department_id] = department.id
        project[:school_id] = department.schools.first.id
      end
    end
    let(:params) { attributes_for(:game).merge(project_attributes: project_attributes) }
    subject { post games_path, params: { game: params } }

    it_behaves_like 'protected page', 302

    context 'has invalid params' do
      let(:params) { { project_attributes: project_attributes.merge(name: '') } }

      it_behaves_like 'protected page'
    end
  end

  describe 'GET /games/:id/edit' do
    subject { get edit_game_path(game) }

    it_behaves_like 'protected page'
  end

  describe 'PUT /games/:id' do
    let(:params) { { genre: :action } }
    subject { put game_path(game), params: { game: params } }

    it_behaves_like 'protected page', 302

    context 'has invalid params' do
      let(:params) { { project_attributes: { name: '' } } }

      it_behaves_like 'protected page'
    end
  end

  describe 'DELETE /games/:id' do
    subject { delete game_path(game) }

    it_behaves_like 'protected page', 302

    it 'remove game' do
      expect { subject }.to change { Game.count }.by(1)
    end
  end
end
