class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update]
  def index
    if params[:search].present?
      @customers = Customer.customer_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @customers.to_csv(['name', 'mail'])}
      end
    else
      @customers = Customer.all
      respond_to do |format|
        format.html
        format.csv { send_data @customers.to_csv(['name', 'mail'])}
      end
    end
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to root_path

    else
      render :new
    end
  end
  def edit

  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end

  def import
    Customer.import(params[:file])
  end

  private

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :mail)
  end
end
