class CustomersController < ApplicationController
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

  def import
    Customer.import(params[:file])
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :mail)
  end
end
