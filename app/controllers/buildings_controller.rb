class BuildingsController < ApplicationController

  def index
    @buildings = Building.all
    @hash = Gmaps4rails.build_markers(@buildings) do |building, marker|
      bldg_link = view_context.link_to building.name, building_path(building)
      marker.lat building.lat
      marker.lng building.long
      marker.title building.name
      marker.infowindow "<h4>#{bldg_link}</h4>"
      marker.picture({
                :url    => "https://i.stack.imgur.com/rU427.png",
                :width  => "32",
                :height => "32"
               })
    end
  end

  def show
    @building = Building.find_by_id(params[:id])
    @stories = @building.stories
    @story = Story.find_by(params[:story_id])
    @photos = @building.photos
  end

  def edit

  end

  def update
    @building = Building.find_by_id(params[:id])
    @story = Story.find_by(params[:story].permit(:id))
    @story.update_attributes(story_params)
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
