class Admins::OrdersController < ApplicationController
    before_action :authenticate_admin!
    def  index
        @orders = Order.page(params[:page])
    end
end
