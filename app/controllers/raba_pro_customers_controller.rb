require 'csv'
class RabaProCustomersController < ApplicationController
  before_action :set_raba_pro_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @raba_pro_customers = RabaProCustomer.raba_pro_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @raba_pro_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @raba_pro_customers = RabaProCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @raba_pro_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @raba_pro_customer = RabaProCustomer.new
  end

  def create
    @raba_pro_customer = RabaProCustomer.new(raba_pro_customer_params)
    if @raba_pro_customer.save
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

  def clean
    @raba_pro_customers = RabaProCustomer.all
    @raba_pro_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to raba_pro_customers_path
  end

  def import
    RabaProCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = RabaProCustomer.raba_pro_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @raba_pro_customers = RabaProCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private

  def set_raba_pro_customer
    @raba_pro_customer = RabaProCustomer.find(params[:id])
  end

  def raba_pro_customer_params
    params.require(:raba_pro_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe, :segment)
  end
end
