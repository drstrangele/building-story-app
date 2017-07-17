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
    # do I need to grab story_id from params & save it with the photo?
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "Successfully added new photo!"
      redirect_to root_path
    else
      flash[:error] = "Error adding new photo!"
      render :new
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
      if @photo.destroy
        flash[:notice] = "Successfully deleted photo!"
        redirect_to root_path
      else
        flash[:alert] = "Error deleting photo!"
      end
    end

private
  def photo_params
    params.require(:photo).permit(:title, :img)
  end
end
