require 'rest-client'

class MainController < ApplicationController
  def index
  end

  def results


  	lat = 47.6062095
  	lng = -122.3320708
  	key = ENV['GOOGLE_PLACES_KEY']

    response_prefix = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="

  	response = RestClient.get "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="+lat.to_s+","+lng.to_s+"&radius=5000&types=restaurant&key="+key
  	@results = JSON.parse(response)["results"]


    @photo_prefix = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference="
    @photo_suffix = "&key="+key


  	cafe_response = RestClient.get "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="+lat.to_s+","+lng.to_s+"&radius=5000&types=cafe&key="+key
  	@cafes = JSON.parse(cafe_response)["results"]

  	bar_response = RestClient.get "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="+lat.to_s+","+lng.to_s+"&radius=5000&types=bar&key="+key
  	@bars = JSON.parse(bar_response)["results"]

    # binding.pry

    # rest_photo_ref = @results["photos"]["photo_reference"]
    # @photo = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference="+rest_photo_ref+"&key="+key
  end
end


