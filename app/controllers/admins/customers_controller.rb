class Admins::CustomersController < ApplicationController
    def top
        @order = Order.where("created_at >= ?", Date.today)
    end 

    def index
        @customers = Customer.page(params[:page]).reverse_order
    end

    def show
        @customer = Customer.find(params[:id])
    end
end
