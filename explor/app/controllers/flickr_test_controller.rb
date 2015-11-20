require 'flickraw'

class FlickrTestController < ApplicationController
  def index
		FlickRaw.api_key=ENV["FLICKR_ID"]
		FlickRaw.shared_secret=ENV["FLICKR_SECRET"]
	#array to use to pull in backgrounds for results page
		flickr_images = []
		per_page = 7
		#loop through search to find search query per limits of number, safe search, content safe, landscape only 
		f_id = flickr.photos.search(:tags => "paris" + "landscape", :per_page => per_page, :content_type => 1, :safe_search => 1).each do |p|
				f_info = flickr.photos.getInfo(:photo_id => p.id)
				#grab url
				url = FlickRaw.url_b(f_info)
				title = f_info.title
				#push to array
				flickr_images.push(url)
			end
			#spits out results in console, remove this when we are in production
			puts flickr_images
			
		render json: f_id




		# f_place = flickr.places.find :query => "new brunswick"
		# f_latitude = f_place[0]['latitude'].to_f
		# f_longitude = f_place[0]['longitude'].to_f
		
		# f_radius = 1
		# args = {}
		# args[:bbox] = "#{f_longitude - f_radius},#{f_latitude - f_radius},#{f_longitude + f_radius},#{f_latitude + f_radius}"
		# # requires a limiting factor, so let's give it one
		# # args[:min_taken_date] = '1890-01-01 00:00:00'
		# # args[:max_taken_date] = '1920-01-01 00:00:00'
		# # args[:accuracy] = 1 # the default is street only granularity [16], which most images aren't...
		# @discovered_pictures = flickr.photos.search args

		# # discovered_pictures.each{|p| url = FlickRaw.url p; puts url}

		# render json: @discovered_pictures


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
