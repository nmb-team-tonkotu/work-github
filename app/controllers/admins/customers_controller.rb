class Admins::CustomersController < ApplicationController
    def top
        @order = Order.all
    end 

    def index
        @customers = Customer.all
    end
end
