class BuildingsController < ApplicationController

  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find_by_id(params[:id])
  end


end
