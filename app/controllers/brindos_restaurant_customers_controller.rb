require 'csv'
class BrindosRestaurantCustomersController < ApplicationController
  before_action :set_brindos_restaurant_customer, only: [ :edit, :update ]

  def index
    if params[:search].present?
      @brindos_restaurant_customers = BrindosRestaurantCustomer.brindos_restaurant_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @brindos_restaurant_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @brindos_restaurant_customers = BrindosRestaurantCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @brindos_restaurant_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @brindos_restaurant_customer = BrindosRestaurantCustomer.new
  end

  def create
    @brindos_restaurant_customer = BrindosRestaurantCustomer.new(brindos_restaurant_customer_params)
    if @brindos_restaurant_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @brindos_restaurant_customer.update(brindos_restaurant_customer_params)
      redirect_to brindos_restaurant_customers_path
    else
      render :edit
    end
  end

  def import
    BrindosRestaurantCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = BrindosRestaurantCustomer.brindos_restaurant_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @brindos_restaurant_customers = BrindosRestaurantCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private

  def set_brindos_restaurant_customer
    @brindos_restaurant_customer = BrindosRestaurantCustomer.find(params[:id])
  end

  def brindos_restaurant_customer_params
    params.require(:brindos_restaurant_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
