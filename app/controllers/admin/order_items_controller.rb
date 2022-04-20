class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_item = OrderItem.find(params[:id])

    @order_item.update(order_item_params)
    @order = @order_item.order

    if @order_item.making_status == "製作中"
      @order.update(order_status: 2)
      @order.save
    end

    if @order.order_items.count == @order.order_items.where(making_status: 3).count
      @order.update(order_status: 3)
      @order.save
    end

    redirect_to request.referer
  end

  private

  def order_item_params
    params.require(:order_item).permit(:order_id, :making_status, :item_count)
  end
end
