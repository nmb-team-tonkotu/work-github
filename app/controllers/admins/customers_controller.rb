class Admins::CustomersController < ApplicationController
    before_action :authenticate_admin!
    before_action :get_customer, only:[:show, :edit, :update]

    def top
        @orders = Order.where(created_at: Time.zone.now.all_day)
    end 

    def index
        @customers = Customer.page(params[:page])
    end

    def show

    end

    def edit

    end

    def update
        if @customer.update(customer_params)
            flash[:notice] = "Updated successfully !!"
            redirect_to admins_customer_path(@customer)
        else
            render 'admins/customers/edit'
        end
    end
    
    private

    def get_customer
		@customer = Customer.find(params[:id])
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
