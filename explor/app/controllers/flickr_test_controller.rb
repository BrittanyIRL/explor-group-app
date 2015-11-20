require 'flickraw'

class FlickrTestController < ApplicationController
  def index
		FlickRaw.api_key=ENV["FLICKR_ID"]
		FlickRaw.shared_secret=ENV["FLICKR_SECRET"]
		#puts "API KEY HERE LJASLKJLSDKJFLAKSJFLD:" + FlickRaw.api_key
		@list = flickr.places.find :query => "new brunswick"
		render json: @list[0]

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
