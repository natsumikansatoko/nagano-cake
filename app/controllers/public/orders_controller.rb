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
      @order.delivery_postal_code = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
      ship = Address.find(params[:order][:address_id])
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name

    elsif params[:order][:my_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.adderss = params[:order][:address]
      @order.name = params[:order][:name]
      @ship = "0"

      unless @order.valid? == true
        @addresses = Address.where(customer: current_customer)
        render :new
      end
    end

  end

  def create
  end

  def thanks
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :adderss, :name, :payment_method, :amount_billed)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

end
