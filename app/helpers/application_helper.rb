# frozen_string_literal: true

module ApplicationHelper
  def fullscreen?
    return unless params[:controller] == 'devise/sessions'
    unless params[:controller] == 'devise/registrations'
      return unless params[:action] == 'new'
    end
    true
  end
end
