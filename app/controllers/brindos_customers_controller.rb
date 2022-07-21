require 'csv'
class BrindosCustomersController < ApplicationController
  before_action :set_brindos_customer, only: [ :edit, :update ]

  def index
    if params[:search].present?
      @brindos_customers = BrindosCustomer.brindos_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @brindos_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @brindos_customers = BrindosCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @brindos_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @brindos_customer = BrindosCustomer.new
  end

  def create
    @brindos_customer = BrindosCustomer.new(brindos_customer_params)
    if @brindos_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @brindos_customer.update(brindos_customer_params)
      redirect_to brindos_customers_path
    else
      render :edit
    end
  end

  def import
    BrindosCustomer.import(params[:file])
    redirect_to root_url, notice: 'brindos_customers imported.'
  end

  def export
    if params[:search].present?
      @mimi_customers = BrindosCustomer.brindos_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @brindos_customers = BrindosCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private

  def set_brindos_customer
    @brindos_customer = BrindosCustomer.find(params[:id])
  end

  def brindos_customer_params
    params.require(:brindos_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
