require 'csv'
class RabaCustomersController < ApplicationController
  before_action :set_raba_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @raba_customers = RabaCustomer.raba_search(params[:search]).paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @raba_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @raba_customers = RabaCustomer.all.paginate(page: params[:page], per_page: 30)
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
    if @raba_customer.update(raba_customer_params)
      redirect_to raba_customers_path
    else
      render :edit
    end
  end

  def clean
    @raba_customers = RabaCustomer.all
    @raba_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to raba_customers_path
  end

  def import
    RabaCustomer.import(params[:file])
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
    params.require(:raba_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe, :segment)
  end
end
