class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @delivery_address = current_customer.delivery_address
  end

  def confirm
  end

  def create
  end

  def thanks
  end

  def index
  end

  def show
  end
end
