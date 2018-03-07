# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :find_project, except: %i[index new create show]

  def index
    @projects =
      current_user
      .projects
      .includes(:school, :department)
      .page(current_page)
  end

  def show
    @project = Project.find(params[:id])
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
        :name, :description, :school_id,
        :department_id, :website, :thumbnail, exhibition_ids: []
      )
  end
end
