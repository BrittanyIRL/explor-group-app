# require 'rubygems'
require 'rest-client'

class MainController < ApplicationController
  def index
  end
  
  def results
    query = 'boston'

    @key = "&key=" + ENV['GOOGLE_PLACES_KEY']
    
    
    

    response_prefix = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="
    response_suffix = "&radius=5000&types=restaurant"
    cafe_radius_type = "&radius=5000&types=cafe"
    bar_radius_type = "&radius=5000&types=bar"

    hydra = Typhoeus::Hydra.hydra

    yahoo_weather_request = Typhoeus::Request.new('https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22' + query + '%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys')
    google_restaurants_request = Typhoeus::Request.new(response_prefix+coordinates_ref+response_suffix+@key)
    google_cafes_request = Typhoeus::Request.new(response_prefix+coordinates_ref+cafe_radius_type+@key)
    google_bars_request = Typhoeus::Request.new(response_prefix+coordinates_ref+bar_radius_type+@key)
    fifth_request = Typhoeus::Request.new("http://example.com/posts/2")  
    
    hydra.queue yahoo_weather_request
    hydra.queue google_restaurants_request
    hydra.queue google_cafes_request
    hydra.queue google_bars_request
    hydra.queue fifth_request
    hydra.run # this is a blocking call that returns once all requests are complete

        #Yahoo API request 
    #response = RestClient.get 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22' + query + '%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys'
    @weather = JSON.parse(response)['query']['results']['channel']['item']
    
    #lat and lng will go to google to generate API request
    lat = @weather['lat']
    lng = @weather['long']

    coordinates_ref = lat + "," + lng
    #end yahoo callback

    #Google places API request 
    #variables brought over from yahoo request
  	# lat = nil
  	# lng = nil
    #google key


  	#response = RestClient.get response_prefix+coordinates_ref+response_suffix+@key
  	@results = JSON.parse(response)["results"]

    #href for image, needs response from below
    @photo_prefix = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference="

    
  	#cafe_response = RestClient.get response_prefix+coordinates_ref+cafe_radius_type+@key
  	@cafes = JSON.parse(cafe_response)["results"]

    
  	#bar_response = RestClient.get response_prefix+coordinates_ref+bar_radius_type+@key
  	@bars = JSON.parse(bar_response)["results"]

    #end google api call

    #flickr API no typheous

    FlickRaw.api_key=ENV["FLICKR_ID"]
    FlickRaw.shared_secret=ENV["FLICKR_SECRET"]
    #array to use to pull in backgrounds for results page
    #background images stored here
    @f_background = []
    per_page = 1
    #loop through search to find search query per limits of number, safe search, content safe, landscape only 
    f_bg_id = flickr.photos.search(:tags => query + "landscape", :per_page => per_page, :content_type => 1, :safe_search => 1).each do |p|

        f_info = flickr.photos.getInfo(:photo_id => p.id)
        #grab url
        url = FlickRaw.url_b(f_info)
        #use for alt text
        title = f_info.title
        #push to array
        @f_background.push(url)
      end
    #spits out results in console, remove this when we are in production
    #puts @f_background

    #grid gallery stored here
    @f_grid = []
    f_grid_id = flickr.photos.search(:tags => query + "travel", :per_page => 15, :content_type => 1, :safe_search => 1).each do |p|

        f_info = flickr.photos.getInfo(:photo_id => p.id)
        #grab url
        url = FlickRaw.url_s(f_info)
        title = f_info.title
        #push to array
        @f_grid.push(url, title)
      end
    #puts @f_grid

  end

end


