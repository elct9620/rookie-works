# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project, except: %i[index new create]

  def index
    @projects = Project.where(user: current_user)
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    return redirect_to root_path if @project.save
    render :new
  end

  def edit; end

  def update
    return redirect_to projects_path if @project.update(project_params)
    render :edit
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  protected

  def find_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params
      .require(:project)
      .permit(
        :name, :description, :exhibition_year, :school_id,
        :department_id, :website, :thumbnail
      )
  end
end