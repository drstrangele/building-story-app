class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
    @building = Building.find_by_id(params[:building_id])
    @story = Story.find_by_id(params[:story_id])
  end

  def create
    @building = Building.find_by_id(params[:building_id])
    @story = Story.find_by_id(params[:story_id])
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "New photo created successfully"
      redirect_to building_path(@building)
    else
      flash[:error] = @photo.errors.full_messages.join(", ")
    end
  end

  def show
    @photo = Photo.find_by_id(params[:id])
  end

  private

  def photo_params
    params.require(:photo).permit(:url, :img, :building_id, :story_id)
  end

end
