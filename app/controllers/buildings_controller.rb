class BuildingsController < ApplicationController

  def index
    @buildings = Building.all
    set_markers
  end

  def show
    @building = Building.find_by_id(params[:id])
    @stories = @building.stories.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
  end

  def update
  end



  private

  def building_params
    params.require(:building).permit(:name, :address, :description, :long, :lat)
  end

  def story_params
    params.require(:story).permit(:title, :description, :img, :user_id, :building_id)
  end

  def set_markers
    @hash = Gmaps4rails.build_markers(@buildings) do |building, marker|
      bldg_link = view_context.link_to building.name, building_path(building)
      marker.lat building.lat
      marker.lng building.long
      marker.title building.name
      marker.infowindow "<h4>#{bldg_link}</h4>"
      marker.picture({
                :url    => "https://i.stack.imgur.com/rU427.png",
                :width  => "38",
                :height => "38"
               })
    end
  end

end
