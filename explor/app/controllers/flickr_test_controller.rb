require 'flickraw'

class FlickrTestController < ApplicationController
  def index
		FlickRaw.api_key=ENV["FLICKR_ID"]
		FlickRaw.shared_secret=ENV["FLICKR_SECRET"]
		#puts "API KEY HERE LJASLKJLSDKJFLAKSJFLD:" + FlickRaw.api_key
		f_place = flickr.places.find :query => "new brunswick"
		f_latitude = f_place[0]['latitude'].to_f
		f_longitude = f_place[0]['longitude'].to_f
		
		f_radius = 1
		args = {}
		args[:bbox] = "#{f_longitude - f_radius},#{f_latitude - f_radius},#{f_longitude + f_radius},#{f_latitude + f_radius}"
		# requires a limiting factor, so let's give it one
		args[:min_taken_date] = '1890-01-01 00:00:00'
		args[:max_taken_date] = '1920-01-01 00:00:00'
		args[:accuracy] = 1 # the default is street only granularity [16], which most images aren't...
		discovered_pictures = flickr.photos.search args
	

		#render json: discovered_pictures


		#info = flickr.photos.getInfo(@list[0]:woeid)
		# render json: list
		#render info


		# id     = list[0].id
		# secret = list[0].secret
		# info = flickr.photos.getInfo :photo_id => id, :secret => secret

		# puts info.title           # => "PICT986"
		# puts info.dates.taken     # => "2006-07-06 15:16:18"

		# sizes = flickr.photos.getSizes :photo_id => id

		# original = sizes.find {|s| s.label == 'Original' }
		# puts original.width       # => "800" -- may fail if they have no original marked image
	end
end
