class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @order_items = OrderItem.where(order_id: @order)
  end

  def update
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order)
    if @order.update(order_status_params)
      redirect_to admin_order_path(@order)
    else
      render :show
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :order_status, :shipping_fee, :amount_billed, :payment_method)
  end
  def order_status_params
    params.require(:order).permit(:order_status)
  end
end
