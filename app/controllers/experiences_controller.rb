# frozen_string_literal: true

class ExperiencesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.latest.published.experience
  end

  def show
    @post = Post.published.experience.find(params[:id])
  end

  def new
    @post = build_post
  end

  def create
    return redirect_to experience_path if build_post.update(post_params)
    render :new
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :thumbnail)
  end

  def build_post
    current_user.posts.build(
      category: :experience,
      status:   :reviewing
    )
  end
end
