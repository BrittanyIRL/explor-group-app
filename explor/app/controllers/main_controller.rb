require 'rest-client'

class MainController < ApplicationController
  def index
  end

  def results
  	response = RestClient.get 'https://maps.googleapis.com/maps/api/place/textsearch/json?query='+'singapore'+'&key=AIzaSyAzBnHtU-hZa_cmI1ZUFL2KoLJg3Bbvob8'
  	@results = JSON.parse(response)["results"]
  end
end
