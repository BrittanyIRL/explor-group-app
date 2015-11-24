class AutocompleteController < ApplicationController
	def search
		@maps_key = ENV['GOOGLE_MAPS_KEY']
	end

end
