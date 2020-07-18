class Admins::CustomersController < ApplicationController
    def top
        @order = Oder.alll
    end 

    def index
        @customers = Customers.all
    end


end
