class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm
    @cart_items =current_customer.cart_items
    @order = Order.new(customer: current_customer,
                       payment_method: params[:order][:payment_method])

    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
      ship = Address.find(params[:order][:address_id])
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name

    elsif params[:order][:my_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.adderss = params[:order][:address]
      @order.name = params[:order][:name]
      @ship = "1"

      unless @order.valid? == true
        @addresses = Address.where(customer: current_customer)
        render :new
      end
    end

  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
      if params[:order][:ship] == "1"
        current_customer.address.create(address_params)
      end
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.item_id = cart_item.item_id
      @order_item.order_id = @order.id
      @order_item.item_count = cart_item.amount
      @order_item.price = cart_item.item.price * cart_item.amount
      @order_item.save
      end
    @cart_items.destroy_all
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
