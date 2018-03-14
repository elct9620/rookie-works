# frozen_string_literal: true

class ExhibitionsController < ApplicationController
  def show
    @exhibition = Exhibition.find(params[:id])
    @projects = @exhibition.projects.page(params[:page])
  end
end
