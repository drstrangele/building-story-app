class BuildingsController < ApplicationController
  before_action :require_ownership, only:[:edit, :update] 

  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find_by_id(params[:id])
    @stories = @building.stories
    @story = Story.find_by(params[:story_id])
  end

  def edit

  end

  def update
    @building = Building.find_by_id(params[:id])
    @story = Story.find_by(params[:story].permit(:id))
    @story.update_attributes(story_params)
    @story.save
    redirect_to building_path(@building)
  end


  private

  def building_params
    params.require(:building).permit(:name, :address, :description, :long, :lat)
  end

  def story_params
    params.require(:story).permit(:title, :description, :img, :user_id, :building_id)
  end

end
