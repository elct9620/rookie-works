# frozen_string_literal: true

module ApplicationHelper
  def fullscreen?
    return unless params[:controller] == 'devise/sessions'
    unless params[:controller] == 'devise/registrations'
      return unless params[:action] == 'new'
    end
    true
  end

  def page_title
    page_name = content_for(:page_name)
    [page_name, t('site_name')].compact.join(' | ')
  end
end
