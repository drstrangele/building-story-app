class StoriesController < ApplicationController
  before_action :require_login,     only: :new
  before_action :require_ownership, only: [:edit, :update, :destroy]
  before_action :set_building,      only: [:show, :new, :create, :edit, :update]
  before_action :set_story,         only: [:show, :edit, :update, :destroy]

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new(photos: [Photo.new])
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      flash[:notice] = "Story saved successfully."
    else
      flash[:error] = @story.errors.full_messages
    end
    redirect_to building_path(@story.building)
  end

  def show
  end

  def edit
  end

  def update
    @story.update_attributes(story_params)
    redirect_to building_path(@building)
  end

  def destroy
    @story.destroy
    redirect_to building_path(@story.building_id)
  end

  private

  def story_params
    params.require(:story).permit(:title, :description, :user_id, :building_id, photos_attributes: [:img])
  end

  def set_building
    @building = Building.find_by_id(params[:building_id])
  end

  def set_story
    @story = Story.find_by_id(params[:id])
  end

end
