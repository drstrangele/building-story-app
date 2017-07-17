class PhotosController < ApplicationController
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
end
