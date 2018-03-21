# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: %i[show]

  def index
    @projects =
      current_user
      .projects
      .includes(:school, :department, :result)
      .page(current_page)
  end

  def show
    @project = Project.find(params[:id])
  end
end
