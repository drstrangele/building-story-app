class PhotosController < ApplicationController

  def index
    @photos = Photo.order('created_at')
  end

  def new
    @photo = Photo.new
    @story = Story.find_by_id(params[:story_id])
    @building = Building.find_by_id(params[:building_id])
  end

  def create
    @story = Story.find_by_id(params[:story_id])
    @building = Building.find_by_id(params[:building_id])
    p = {img: params[:photo][:img], story: @story}
    @photo = Photo.new(p)
    if @photo.save
      flash[:notice] = "Successfully added new photo!"
    else
      flash[:error] = "Error adding new photo!"
      render :new
    end
    redirect_to building_story_path(@story.building_id, @story)
  end

  def destroy
    @building = Building.find_by_id(params[:building_id])
    @story = Story.find_by_id(params[:story_id])
    @photo = Photo.find(params[:id])
      if @photo.destroy
        flash[:notice] = "Successfully deleted photo!"
        redirect_to building_story_path(@story)
      else
        flash[:alert] = "Error deleting photo!"
      end
    end

private
  def photo_params
    params.require(:photo).permit(:title, :img)
  end
end
