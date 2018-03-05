# frozen_string_literal: true

module NavigationHelper
  def nav_link(name, path, options = {})
    content_tag :li do
      link_to name, path, options
    end
  end

  def user_projects_link
    if user_signed_in?
      nav_link t('shared.nav.projects'), projects_path
    else
      capture do
        concat nav_link t('shared.nav.signin'), new_user_session_path
        concat nav_link t('shared.nav.signup'), new_user_registration_path
      end
    end
  end

  def nav_wrapper(&block)
    style = %w[navbar navbar-default navbar-fixed-top]
    options = {}
    if transparent_nav?
      style << 'navbar-transparent'
      options['color-on-scroll'] = 40
    end

    content_tag :nav, options.merge(class: style), &block
  end

  def transparent_nav?
    content_for(:nontransparent_nav).nil?
  end
end
