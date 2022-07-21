require 'csv'
class RabaCustomersController < ApplicationController
  before_action :set_raba_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @raba_customers = RabaCustomer.raba_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @raba_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @raba_customers = RabaCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @raba_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @raba_customer = RabaCustomer.new
  end

  def create
    @raba_customer = RabaCustomer.new(raba_customer_params)
    if @raba_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @porto_customer.update(porto_customer_params)
      redirect_to porto_customers_path
    else
      render :edit
    end
  end

  def import
    RabaCustomer.import(params[:file])
    redirect_to root_url, notice: 'raba_customers imported.'
  end
  def export
    if params[:search].present?
      @mimi_customers = RabaCustomer.raba_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @raba_customers = RabaCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private

  def set_raba_customer
    @raba_customer = RabaCustomer.find(params[:id])
  end

  def raba_customer_params
    params.require(:raba_customer).permit(:name, :mail)
  end
end
