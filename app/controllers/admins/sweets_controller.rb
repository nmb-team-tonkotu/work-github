class Admins::SweetsController < ApplicationController


	def index
	  @sweets = Sweet.page(params[:page]).reverse_order
	end

	def show
	  @sweet = Sweet.find(params[:id])
	end

	def new
	  @sweet = Sweet.new
	end

	def create
	  @sweet = Sweet.new(sweet_params)
	  if @sweet.save
	   redirect_to admins_sweet_path(@sweet.id)
	  else
		render 'new'
	  end
	end

	def edit
	  @sweet = Sweet.find(params[:id])
	end

	def update
	  @sweet = Sweet.find(params[:id])
	  if @sweet.update(sweet_params)
	  	redirect_to admins_sweet_path(@sweet.id)
	  else
	  	render 'edit'
	  end
	end

	private

	def sweet_params
		params.require(:sweet).permit(:name,:explanation,:non_taxed_price,:image,:sell_status,:genre_id)
	end
end
