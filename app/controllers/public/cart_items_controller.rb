class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.where(customer: current_customer)
    @customer = Customer.find(current_customer.id)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_items_params)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def delete
    @cart_item = CartItem.find(params[:id])
    @cart_item.delete
    redirect_back(fallback_location: root_path)
  end

  def delete_all
    CartItem.where(customer_id: current_customer.id).delete_all
    redirect_back(fallback_location: root_path)
  end

  def create
    @cart_item_check =CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item])
    if @cart_item_check
      @cart_item_check.amount += params[:cart_item, :amount].to_i
      @cart_item_check.save
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_items_params)
      @cart_item.customer_id = current_customer.id
      if @cart_item.save
        redirect_to cart_items_path
      else
        render ("items/show")
      end
    end
  end

  private
  def cart_items_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
