# frozen_string_literal: true

module NavigationHelper
  def nav_link(name, path, options = {})
    content_tag :li do
      link_to name, path, options
    end
  end

  def user_projects_link
    if user_signed_in?
      nav_link 'My Projects', projects_path
    else
      nav_link 'Sign in', new_user_session_path
    end
  end
end
