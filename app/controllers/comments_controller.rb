# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  RESOURCE_RULE = %r{\/([^\/]+)\/(\d+)\/comments}

  def create
    comment = resource.comments.create(
      content: comment_params[:content],
      user: current_user
    )
    if comment.valid?
      redirect_to resource_path(anchor: "comment-#{comment.id}")
    else
      # TODO: Improve error message display
      redirect_to resource_path(anchor: 'comment-form'),
                  flash: { comment_errors: comment.errors }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :content
    )
  end

  # TODO: Rewrite as concern
  def resource
    @resource ||= resource_name.classify.constantize.find(resource_id)
  end

  def resource_id
    @resource_id ||= url_for[RESOURCE_RULE, 2].to_i
  end

  def resource_name
    @resource_name ||= url_for[RESOURCE_RULE, 1].singularize
  end

  def resource_path(options = {})
    polymorphic_path(resource, options)
  end
end
