class StoriesController < ApplicationController
  before_action :require_login, only: :new
  before_action :require_ownership, only:[:edit]
  before_action :set_building, only: [:new, :create, :edit, :show, :update]

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    s = story_params
    s[:building_id] = @building.id
    @story = Story.new(s)
    if @story.save
      p = {img: params[:story][:img], story: @story}

        Photo.create(p)

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
  end

  def update
    @story = Story.find_by_id(params[:id])
    @story.update_attributes(story_params)
    redirect_to building_path(@building)
  end

  def destroy
    @story = Story.find_by(id: params[:id])
    @story.destroy
    redirect_to building_path(@story.building_id)
  end

  private

  def story_params
    params.require(:story).permit(:title, :description, :user_id)
  end

  def photo_params
    params.require(:story).permit(:title, :description, :user_id, :img)
  end

  def set_building
    @building = Building.find_by_id(params[:building_id])
  end

end
