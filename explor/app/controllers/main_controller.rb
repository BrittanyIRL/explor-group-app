require 'rest-client'

class MainController < ApplicationController
  def index
  end

  def results

  	lat = 47.6062095
  	lng = -122.3320708
  	@key = "&key=" + ENV['GOOGLE_PLACES_KEY']

    coordinates_ref = lat.to_s+","+lng.to_s

    response_prefix = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="
    response_suffix = "&radius=5000&types=restaurant"

  	response = RestClient.get response_prefix+coordinates_ref+response_suffix+@key
  	@results = JSON.parse(response)["results"]

    @photo_prefix = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference="

    cafe_radius_type = "&radius=5000&types=cafe"
  	cafe_response = RestClient.get response_prefix+coordinates_ref+cafe_radius_type+@key
  	@cafes = JSON.parse(cafe_response)["results"]

    bar_radius_type = "&radius=5000&types=bar"
  	bar_response = RestClient.get response_prefix+coordinates_ref+bar_radius_type+@key
  	@bars = JSON.parse(bar_response)["results"]
  end

end


