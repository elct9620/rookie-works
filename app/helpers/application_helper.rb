# frozen_string_literal: true

module ApplicationHelper
  def fullscreen?
    return unless params[:controller] == 'devise/sessions'

    return if params[:controller] != 'devise/registrations' && params[:action] != 'new'

    true
  end

  def page_title
    page_name = content_for(:page_name)
    [page_name, t('site_name')].compact.join(' | ')
  end

  def alert_messages
    return if flash.alert.blank?

    content_tag :div, flash.alert, class: 'alert alert-danger'
  end
end
