class DeliveriesController < ApplicationController
	before_action :authenticate_customer!

	def index
		@deliveries = Address.where(customer_id: current_customer.id)
	end

	def edit
	end

	def update
	end

	private

end
