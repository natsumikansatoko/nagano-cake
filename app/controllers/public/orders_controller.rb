class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm
    @order = Order.new(order_params)

    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]

    else
      render :new
    end

    @cart_items = current_customer.cart_items.all
    @order.customer_id = current_customer.id

  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save!

    current_customer.cart_items.all.each do |cart_item|
      @order_item = @order.order_items.new
      @order_item.item_id = cart_item.item_id
      @order_item.order_id = @order.id
      @order_item.amount = cart_item.amount
      @order_item.ordered_price = cart_item.item.price * cart_item.amount
      @order_item.making_status = 0
      @order.order_status = 0
      @order_item.save
      current_customer.cart_items.destroy_all
    end

    redirect_to orders_thanks_path
  end


  def thanks
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :amount_billed)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

end
