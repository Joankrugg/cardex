require 'csv'
class PortoRestaurantCustomersController < ApplicationController
  before_action :set_porto_restaurant_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @porto_restaurant_customers = PortoRestaurantCustomer.porto_restaurant_search(params[:search]).paginate(page: params[:page], per_page: 30)
      respond_to do |format|
        format.html
        format.csv { send_data @porto_restaurant_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @porto_restaurant_customers = PortoRestaurantCustomer.all.paginate(page: params[:page], per_page: 30)
      respond_to do |format|
        format.html
        format.csv { send_data @porto_restaurant_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @porto_restaurant_customer = PortoRestaurantCustomer.new
  end

  def create
    @porto_restaurant_customer = PortoRestaurantCustomer.new(porto_restaurant_customer_params)
    if @porto_restaurant_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @porto_restaurant_customer.update(porto_restaurant_customer_params)
      redirect_to porto_restaurant_customers_path
    else
      render :edit
    end
  end

  def clean
    @porto_restaurant_customers = PortoRestaurantCustomer.all
    @porto_restaurant_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to porto_restaurant_customers_path
  end

  def import
    PortoRestaurantCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = PortoRestaurantCustomer.porto_restaurant_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @porto_restaurant_customers = PortoRestaurantCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_porto_restaurant_customer
    @porto_restaurant_customer = PortoRestaurantCustomer.find(params[:id])
  end

  def porto_restaurant_customer_params
    params.require(:porto_restaurant_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
