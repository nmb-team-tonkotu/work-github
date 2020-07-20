class Admins::GenresController < ApplicationController
  def index
     @genre = Genre.new
     @genres = Genre.all
  end

  def create
     @genre = Genre.new(genre_params)
       if @genre.save
          redirect_to admins_genres_path, notice:"You have creatad new genre successfully."
       else
          @genres = Genre.all
          render 'index'
       end
  end

  def edit
     @genre = Genre.find(params[:id])
  end

  def update
     @genre = Genre.find(params[:id])
       if @genre.update(genre_params)
          @genre = Genre.find(params[:id])
          redirect_to admins_genres_path, notice:"You have edited genre successfully."
        else
          render 'edit'
        end

  end

  private

  def genre_params
		 params.require(:genre).permit(:sweet_genre,:status,:genre_id)
	end

end
