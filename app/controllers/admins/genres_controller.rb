class Admins::GenresController < ApplicationController
  def index
    @genre = genre.new
    @genres = genre.all
  end

  def create
    @genre = genre.new(genre_params)
	end

  end

  def edit
    @genre = genre.find(params[:id])
  end

  def update
    @genru = genre.find(params[:id])
  end

  private

  def genre_params
		params.require(:genre).permit(:sweet_genre,:status,:genre_id)
	end

end
