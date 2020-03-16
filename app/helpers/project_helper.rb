# frozen_string_literal: true

module ProjectHelper
  def bookmark_button(project)
    style = %w[btn btn-fill btn-lg btn-success]

    if current_user.bookmarks.exists?(project: project)
      bookmark = current_user.bookmarks.find_by(project: project)
      link_to t('.unbookmark'), bookmark,
              data: { method: :delete }, class: style.join(' ')
    else
      link_to t('.bookmark'), bookmarks_path(project_id: project.id),
              data: { method: :post }, class: style.join(' ')
    end
  end
end
