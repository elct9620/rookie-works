# frozen_string_literal: true

class ExperiencesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_post, only: %i[edit update]

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
    return redirect_to experiences_path if build_post.update(post_params)
    render :new
  end

  def edit; end

  def update
    return redirect_to experience_path(@post) if @post.update(post_params)
    render :edit
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

  def find_post
    @post = current_user.posts.find(params[:id])
  end
end
