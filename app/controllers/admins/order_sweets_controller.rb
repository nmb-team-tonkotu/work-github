class Admins::OrderSweetsController < ApplicationController
    def update
        order_sweet = OrderSweet.find(params[:id])
        order_sweet.update(order_sweet_params)
        flash[:notice] = "Created successfully !!"
        redirect_to admins_order_path(order_sweet.order_id)
    end
    private
    def order_sweet_params
        params.require(:order_sweet).permit(:create_status)
    end
end
