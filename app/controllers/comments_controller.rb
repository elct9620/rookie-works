# frozen_string_literal: true

class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  RESOURCE_RULE = %r{\/([^\/]+)\/(\d+)\/comments}

  def create
    # TODO: Display error message
    resource.comments.create(
      content: comment_params[:content],
      user: current_user
    )
    redirect_back fallback_location: experiences_path
  end

  private

  def comment_params
    params.require(:comment).permit(
      :content
    )
  end

  # TODO: Rewrite as concern
  def resource
    resource_name.classify.constantize.find(resource_id)
  end

  def resource_id
    @resource_id ||= url_for[RESOURCE_RULE, 2].to_i
  end

  def resource_name
    @resource_name ||= url_for[RESOURCE_RULE, 1].singularize
  end
end
