# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @projects =
      Project
      .includes(:school, :department)
      .page(params[:page])
      .per(50) # TODO: Let it changable
  end
end
