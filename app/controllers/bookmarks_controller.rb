# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    # TODO
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
end
