class CustomersController < ApplicationController
	before_action :authenticate_customer!
	before_action :get_customer, only:[:show, :edit, :update, :close]

	def show
	end

	def edit
	end

	def update
		if @customer.update(customer_params)
			flash[:notice] = "Updated successfully !!"
			redirect_to customers_path(current_customer.id)
		else
			render ("customers/edit")
		end
	end

	def close_view
	end

	def close
		@customer.update(is_active: "Invalid")
		reset_session
		redirect_to root_path
	end

	private

	def get_customer
		@customer = Customer.find(current_customer.id)
	end

	def customer_params
		params.require(:customer).permit(
			:family_name,
			:first_name,
			:kana_family_name,
			:kana_first_name,
			:email,
			:postal_code,
			:address,
			:phone_number,
			:is_active
		)
	end

end
