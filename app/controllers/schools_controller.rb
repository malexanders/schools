class SchoolsController < ApplicationController
  def index
    @schools = School.all
    respond_to do |format|
      format.json { render json: @schools }
    end
  end

  def show
    @school = School.where(slug: params[:slug])
    respond_to do |format|
      format.json { render json: @school }
    end
  end
end
