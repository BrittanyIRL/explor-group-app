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
  	redirect_to places_path
  end

  def update
    favorite = @current_user.favorites.find_by(place_id: params[:place_id])
    favorite.update status_params
    redirect_to places_path
  end

  def destroy
    favorite = @current_user.favorites.find_by(place_id: params[:place_id])
    favorite.destroy
    redirect_to places_path
  end

  private

  def status_params
    params.require(:favorite).permit(:status)
  end

  def place_params
  	params.require(:favorite).permit(:categories, :title, :img, :vicinity, :place_id, :price_level, :rating, :status)
  end

  def location_params
  	params.require(:favorite).permit(:name)
  end
end
