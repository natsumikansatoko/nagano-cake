class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @addres = Address.new(address_params)
    @addres.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      @customer = current_customer
      @addresses = @customer.addresses
      render :edit
    end
  end

  def update
  end

  def destroy
  end
end
