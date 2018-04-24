# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :picked_platform, only: :index

  def index
    @projects = query.result(distinct: true)

    include_platform if picked_platform.any?

    @projects =
      @projects
      .includes(:school, :department)
      .latest
      .page(current_page)
      .per(50) # TODO: Let it changable
  end

  def create
    # TODO: Show error messages
    current_user.bookmarks.create(project_id: params[:project_id])
    redirect_back fallback_location: root_path
  end

  def destroy
    current_user
      .bookmarks
      .find(params[:id])
      .destroy
    redirect_back fallback_location: projects_path
  end

  private

  def query
    @q =
      Project
      .where(id: current_user.bookmarks.pluck(:project_id))
      .ransack(params[:q])
  end

  def include_platform
    @projects = @projects.where(result: Game.platform_is(@picked_platform))
  end

  def picked_platform
    @picked_platform ||=
      (params[:q]&.delete(:result_of_Game_type_platform_in) || [])
      .reject(&:blank?)
  end
end
