class Admins::SweetsController < ApplicationController
	def index
	  @sweets = Sweet.page(params[:page]).reverse_order
	end

	def show
	  @sweet = Sweet.find(params[:id])
	end

	def new
	  # @admin = Admin.find(params[:admin_id])
	  @sweet = Sweet.new

	end

	def create
	  @sweet = Sweet.new(sweet_params)
	  @sweet.save
	  redirect_to admins_sweet_path(@sweet.id)
	end

	def edit
	  @sweet = Sweet.find(params[:id])
	end

	def update
	  @sweet = Sweet.find(params[:id])
	  @sweet.update(sweet_params)
	end

	private

	def sweet_params
		params.require(:sweet).permit(:name,:explanation,:non_taxed_price,:image_id,:sell_status,:genre_id)
	end

end
