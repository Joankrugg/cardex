class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update]
  def index
    if params[:search].present?
      @customers = Customer.customer_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @customers.to_csv(['name', 'email'])}
      end
    else
      @customers = Customer.all
      respond_to do |format|
        format.html
        format.csv { send_data @customers.to_csv(['name', 'email'])}
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
  def fusion
    Customer.where.not(id: Customer.group(:email).select("min(id)")).delete_all
    redirect_to customers_path
  end

  def import
    Customer.import(params[:file])
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :address, :creator_id, :type_id, :type_name, :sector_id, :city, :zipcode, :surname, :position, :phone)
  end
end
