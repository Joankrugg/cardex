require 'csv'
class RabaRestaurantCustomersController < ApplicationController
  before_action :set_raba_restaurant_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @raba_restaurant_customers = RabaRestaurantCustomer.raba_restaurant_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @raba_restaurant_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @raba_restaurant_customers = RabaRestaurantCustomer.all.paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @raba_restaurant_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @raba_restaurant_customer = RabaRestaurantCustomer.new
  end

  def create
    @raba_restaurant_customer = RabaRestaurantCustomer.new(raba_restaurant_customer_params)
    if @raba_restaurant_customer.save
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
    @raba_restaurant_customers = RabaRestaurantCustomer.all
    @raba_restaurant_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to raba_restaurant_customers_path
  end

  def import
    RabaRestaurantCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = RabaRestaurantCustomer.raba_restaurant_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @raba_restaurant_customers = RabaRestaurantCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private

  def set_raba_restaurant_customer
    @raba_restaurant_customer = RabaRestaurantCustomer.find(params[:id])
  end

  def raba_restaurant_customer_params
    params.require(:raba_restaurant_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe, :segment)
  end
end
