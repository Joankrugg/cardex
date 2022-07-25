require 'csv'
class SacyProCustomersController < ApplicationController
  before_action :set_sacy_pro_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @sacy_pro_customers = SacyProCustomer.sacy_pro_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @sacy_pro_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @sacy_pro_customers = SacyProCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @sacy_pro_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @sacy_pro_customer = SacyProCustomer.new
  end

  def create
    @sacy_pro_customer = SacyProCustomer.new(sacy_pro_customer_params)
    if @sacy_pro_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @sacy_pro_customer.update(sacy_pro_customer_params)
      redirect_to sacy_pro_customers_path
    else
      render :edit
    end
  end

  def import
    SacyProCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = SacyProCustomer.sacy_pro_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @sacy_pro_customers = SacyProCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_sacy_pro_customer
    @sacy_pro_customer = SacyProCustomer.find(params[:id])
  end

  def sacy_pro_customer_params
    params.require(:sacy_pro_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
