# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :picked_platform

  # TODO: Improve filter using FilterService or Search Model
  def index
    @announcements = Announcement.recent(5)
    @q = Project.ransack(params[:q])
    @projects = @q.result(distinct: true)

    include_platform if picked_platform.any?

    @projects =
      @projects
      .includes(:school, :department)
      .latest
      .page(current_page)
      .per(50) # TODO: Let it changable
  end

  private

  def include_platform
    @projects = @projects.where(result: Game.platform_is(@picked_platform))
  end

  def picked_platform
    @picked_platform ||=
      (params[:q]&.delete(:result_of_Game_type_platform_in) || [])
      .reject(&:blank?)
  end
end
