class OrdersController < ApplicationController
	before_action :authenticate_customer!

	def  new
	    @order = Order.new
	    @addresses = Address.where(customer_id: current_customer.id)
	end

	def  confirm
		@order = Order.new(order_params)
		@cart_items = CartItem.where(customer_id: current_customer.id)

		if params[:address_option] == "0"
		  	@order.customer_name = current_customer.family_name + current_customer.first_name
		  	@order.postal_code = current_customer.postal_code
		  	@order.address = current_customer.address
		  	@order.address_name = current_customer.family_name + current_customer.first_name
		elsif params[:address_option] == "1"
	       @address = Address.find(params[:order][:current_customer_address].to_i)
	       @order.customer_name = current_customer.family_name + current_customer.first_name
	       @order.address = @address.address
	       @order.postal_code = @address.postal_code
	       @order.address_name = @address.name
		else params[:address_option] == "2"
			@order.customer_name = current_customer.family_name + current_customer.first_name
		end

		@order.postage = 800

	end

	def  create
	    @order = Order.new(order_params)
	    if @order.save
		    @cart_items = CartItem.where(customer_id: current_customer.id)
		    @cart_items.each do |cart_item|

		    	@order_sweet = OrderSweet.new
		    	@order_sweet.order_id = @order.id
		    	@order_sweet.count = cart_item.sweet_count
		    	@order_sweet.price = "#{(cart_item.sweet.non_taxed_price*1.1).round}"
		    	@order_sweet.sweet_id = cart_item.sweet.id
		    	@order_sweet.save
		    end
		    @cart_items.destroy_all
		    redirect_to orders_thanks_path
		else
			@cart_items = CartItem.where(customer_id: current_customer.id)
			render ("orders/confirm")
		end
	end

	def thanks
	end

	def index
		@orders = current_customer.orders.page(params[:page]).reverse_order
	end

	def show
		@order = Order.find(params[:id])
		@order_sweet = @order.order_sweets
	end


	private

	def order_params
		params.require(:order).permit(
			:customer_id,
			:customer_name,
			:postal_code,
			:address,
			:postage,
			:payment_method,
			:billing_amount,
			:status,
			:address_name
		)
	end
end
