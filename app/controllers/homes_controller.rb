class HomesController < ApplicationController
	def top
		@genres = Genre.where(status: "true")

		search_genre_id = params[:search_id]
		search_sweet = Sweet.where(genre_id: search_genre_id)

		if search_genre_id.present?
			@sweets = search_sweet.where(sell_status: "true")
		else
			@sweets = Sweet.where(sell_status: "true")
		end
	end
end
