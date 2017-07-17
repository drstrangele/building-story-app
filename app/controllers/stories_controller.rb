class StoriesController < ApplicationController
  before_action :require_login, only: :new
  before_action :require_ownership, only:[:edit]

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
    @building = Building.find_by(params[:id])
  end

  def create
    @building = Building.find_by(params[:id])
    s = story_params
    s[:building_id] = @building.id
    @story = Story.new(s)
    if @story.save
      flash[:notice] = "Story saved successfully."
    else
      flash[:error] = @story.errors.full_messages
    end
    redirect_to building_path(@building)
  end

  def show
    story_id = params[:id]
    @story = Story.find_by_id(story_id)
  end

  def edit
    @story = Story.find_by(id: params[:id])
    @building = Building.find_by_id(@story.building_id)
  end

  def update
    @building = Building.find_by_id(params[:building_id])
    @story = Story.find_by_id(params[:id])
    @story.update_attributes(story_params)
    redirect_to building_path(@building)
  end

  def destroy
    @story = Story.find_by(id: params[:id])
    @building = @story.building_id
    @story.delete
    redirect_to building_path(@building)
  end

  private

  def story_params
    params.require(:story).permit(:title, :description, :user_id)
  end

  def photo_params
    params.require(:story).permit(:img, :title)
  end

end
