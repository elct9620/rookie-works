# frozen_string_literal: true

class BookmarksController < ApplicationController
  include PlatformFilter

  before_action :picked_platform, only: :index
  before_action :authenticate_user!

  def index
    @projects = query.result(distinct: true)
    @projects = include_platform(@projects)

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
end
