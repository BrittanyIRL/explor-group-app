class PlacesController < ApplicationController
  before_action :is_authenticated?
  
  def index
    @locations = @current_user.locations.all
  end

  def create
  	@current_user.locations.find_or_create_by location_params # works
  	@location = Location.find_by location_params
  	puts @location
  	@current_user.favorites << @location.favorites.create(place_params) # works
  	
  end

  def destroy
    Favorite.find(params[:id]).destroy
    redirect_to places_path
  end

  private

  def place_params
  	params.require(:favorite).permit(:categories, :title, :img, :vicinity, :place_id, :price_level, :rating)
  end

  def location_params
  	params.require(:favorite).permit(:name)
  end

end
