class OrdersController < ApplicationController
	before_action :authenticate_customer!

    def  new
        @order = Order.new
        @addresses = Address.where(customer_id: current_customer.id)
    end

    def  confirm
    	@cart_items = CartItem.where(customer_id: current_customer.id)
      @order = Order.new(order_params)


      	if params[:address_option] == "0"

      	 @order.customer = current_customer
         @order.customer_name = current_customer.first_name +  current_customer.family_name
      	 @order.postal_code = current_customer.postal_code
      	 @order.address = current_customer.address
      elsif params[:address_option] == "1"

      	 @order = Order.new(order_params)

      else params[:address_option] == "2"
	   end
    end



    def  create
        @order = Order.new(order_params)
	    @order.save
	    rediect_to orders_thanks_path
    end

    def thanks
    end

    def  show

    end

     def index
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
			:status)
	end
end