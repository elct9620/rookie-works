# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @q =
      Project
      .ransack(params[:q])
    @projects =
      @q
      .result(distinct: true)
      .includes(:school, :department)
      .page(params[:page])
      .per(50) # TODO: Let it changable
  end
end
