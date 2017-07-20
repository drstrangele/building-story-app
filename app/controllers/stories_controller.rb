class StoriesController < ApplicationController
  before_action :require_login,     only: :new
  before_action :require_ownership, only: [:edit, :update, :destroy]
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
      redirect_to building_path(@story.building)
    else
      flash.now[:error] = @story.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @story.update(story_params)
      flash[:notice] = "Story updated successfully."
      redirect_to building_path(@story.building)
    else
      flash.now[:error] = @story.errors.full_messages
      render :edit
    end
  end

  def destroy
    @story.destroy
    redirect_to building_path(@story.building)
  end

  private

  def story_params
    params.require(:story).permit(:title, :description, :user_id, :building_id, photos_attributes: [:img])
  end

  def set_story
    @story = Story.find_by_id(params[:id])
  end

end
