class CartItemsController < ApplicationController
	before_action :authenticate_customer!

	def index
		@cart_items = current_customer.cart_items
	end

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.customer_id = current_customer.id

		customer_cart_items = CartItem.where(customer_id: current_customer.id)
		alreadry_customer_cart_item = customer_cart_items.find_by(sweet_id: @cart_item.sweet_id)

		if alreadry_customer_cart_item.nil?
			if @cart_item.save
				redirect_to cart_items_path(current_customer)
			else
				@sweet = Sweet.find(params[:cart_item][:sweet_id])
				render ("sweets/show")
			end
		else
			alreadry_customer_cart_item.sweet_count += params[:cart_item][:sweet_count].to_i
			alreadry_customer_cart_item.save
			redirect_to cart_items_path(current_customer)
		end
	end

	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.customer_id = current_customer.id
		@cart_item.update(cart_item_params)
		redirect_to cart_items_path(current_customer)
	end

	def destroy
		@cart_item = CartItem.find(params[:id])
		@cart_item.destroy
		redirect_to cart_items_path(current_customer)
	end

	def destroy_all
		@cart_items = current_customer.cart_items
		@cart_items.destroy_all
		redirect_to cart_items_path(current_customer)
	end

	private

	def cart_item_params
		params.require(:cart_item).permit(:sweet_id, :sweet_count)
	end
end
