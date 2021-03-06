require 'csv'
class MillesimeCustomersController < ApplicationController
  before_action :set_millesime_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @millesime_customers = MillesimeCustomer.millesime_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @millesime_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @millesime_customers = MillesimeCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @millesime_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @millesime_customer = MillesimeCustomer.new
  end

  def create
    @millesime_customer = MillesimeCustomer.new(millesime_customer_params)
    if @millesime_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @megeve_customer.update(megeve_customer_params)
    else
      render :edit
    end
  end

  def import
    MillesimeCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = MillesimeCustomer.millesime_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @millesime_customers = MillesimeCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_millesime_customer
    @millesime_customer = MillesimeCustomer.find(params[:id])
  end

  def millesime_customer_params
    params.require(:millesime_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe, :phone, :home, :address, :segment)
  end
end



