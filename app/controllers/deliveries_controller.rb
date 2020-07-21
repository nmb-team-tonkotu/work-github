class DeliveriesController < ApplicationController
	before_action :authenticate_customer!
	before_action :get_address, only:[:edit, :update, :destroy]

	def index
		@delivery = Address.new
		@deliveries = Address.where(customer_id: current_customer.id)
	end

	def create
		@delivery = Address.new(delivery_params)
		@delivery.customer_id = current_customer.id

		if @delivery.save
			flash[:notice] = "Created successfully !!"
			redirect_to deliveries_path
		else
			@deliveries = Address.where(customer_id: current_customer.id)
			render ("deliveries/index")
		end
	end

	def edit
	end

	def update
		if @delivery.update(delivery_params)
			flash[:notice] = "Updated successfully !!"
			redirect_to deliveries_path
		else
			render ("deliveries/edit")
		end
	end

	def destroy
		@delivery.destroy
		flash[:notice] = "Destroyed successfully !!"
		redirect_to deliveries_path
	end

	private

	def get_address
		@delivery = Address.find(params[:id])
	end

	def delivery_params
		params.require(:address).permit(
			:postal_code,
			:address,
			:name
		)
	end

end
