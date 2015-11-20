require 'flickraw'

class FlickrTestController < ApplicationController
  def index
		FlickRaw.api_key=ENV["FLICKR_ID"]
		FlickRaw.shared_secret=ENV["FLICKR_SECRET"]
	#array to use to pull in backgrounds for results page
		f_background = []
		per_page = 7
		#loop through search to find search query per limits of number, safe search, content safe, landscape only 
		f_bg_id = flickr.photos.search(:tags => "paris" + "landscape", :per_page => per_page, :content_type => 1, :safe_search => 1).each do |p|

				f_info = flickr.photos.getInfo(:photo_id => p.id)
				#grab url
				url = FlickRaw.url_b(f_info)
				title = f_info.title
				#push to array
				f_background.push(url)
			end
			#spits out results in console, remove this when we are in production
		puts f_background

		f_grid = []
		f_grid_id = flickr.photos.search(:tags => "paris" + "travel", :per_page => 15, :content_type => 1, :safe_search => 1).each do |p|

				f_info = flickr.photos.getInfo(:photo_id => p.id)
				#grab url
				url = FlickRaw.url_b(f_info)
				title = f_info.title
				#push to array
				f_grid.push(url, title)
			end
		puts f_grid



			
		render json: f_grid_id

	end

end
