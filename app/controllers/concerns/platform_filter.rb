# frozen_string_literal: true

module PlatformFilter
  extend ActiveSupport::Concern

  def include_platform(projects)
    return projects if picked_platform.empty?

    projects.where(result: Game.platform_is(picked_platform))
  end

  def picked_platform
    @picked_platform ||=
      (params[:q]&.delete(:result_of_Game_type_platform_in) || [])
      .reject(&:blank?)
  end
end
