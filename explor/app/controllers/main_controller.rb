require 'rest-client'

class MainController < ApplicationController
  def index
  end

  def results

  	lat = 47.6062095
  	lng = -122.3320708
  	key = ENV['GOOGLE_PLACES_KEY']

  	response = RestClient.get "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="+lat.to_s+","+lng.to_s+"&radius=5000&types=restaurant&key="+key
  	@results = JSON.parse(response)["results"]

  	cafe_response = RestClient.get "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="+lat.to_s+","+lng.to_s+"&radius=5000&types=cafe&key="+key
  	@cafes = JSON.parse(cafe_response)["results"]

  	bar_response = RestClient.get "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="+lat.to_s+","+lng.to_s+"&radius=5000&types=bar&key="+key
  	@bars = JSON.parse(bar_response)["results"]
  end
end


