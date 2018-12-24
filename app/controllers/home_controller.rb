# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :picked_platform
  helper_method :current_year

  # TODO: Improve filter using FilterService or Search Model
  def index
    @announcements = Announcement.recent(5)
    @q = Project.ransack(params[:q])
    @projects = @q.result(distinct: true)

    include_platform if picked_platform.any?
    filter_default_years if params[:q].nil?
    load_projects
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

  def filter_default_years
    @projects = @projects.where(published_year: current_year)
  end

  def load_projects
    @projects =
      @projects
      .includes(:school, :department)
      .latest
      .page(current_page)
      .per(50) # TODO: Let it changable
  end

  def current_year
    Date.current.year + (Date.current.month / 12.0).round
  end
end
