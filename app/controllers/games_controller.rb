# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_game, except: %i[new create]

  def new
    @game = Game.new
    @game.project = Project.new
  end

  def create
    @game = Game.new(permitted_params)
    @game.project.user = current_user
    return redirect_to projects_path if @game.save

    render :new
  end

  def edit; end

  def update
    return redirect_to projects_path if @game.update(permitted_params)

    render :edit
  end

  def destroy
    @game.destroy
    redirect_to projects_path
  end

  private

  def find_game
    @game = current_user.games.find(params[:id])
  end

  def permitted_params
    params
      .require(:game)
      .permit(
        :download_link, :genre,
        platform: [],
        project_attributes: project_attributes
      )
  end

  def project_attributes
    [
      :name, :description, :school_id, :video,
      :department_id, :website, :thumbnail, exhibition_ids: []
    ]
  end
end
