class Admins::OrdersController < ApplicationController
    before_action :authenticate_admin!
    before_action :get_order, only:[:show, :update]

    def  index
        @orders = Order.page(params[:page])
    end
    def show


    end

    def update
        @order.update(order_params)
        redirect_to admins_orders_path
    end

    private

    def get_order
        @order = Order.find_by(id: params[:id])
    end

    def order_params
        params.require(:order).permit(:status)
    end
end