class SweetsController < ApplicationController
	def index
		@sweets = Sweet.all

	end

	def show
		@sweet = Sweet.find(params[:id])
	end

	def search
		if params[:genre].present?
			@sweets = Sweet.where('genre LIKE ?',"%#{params[:genre]}%")
		else
			@sweets = Sweet.none
		end
	end

end
