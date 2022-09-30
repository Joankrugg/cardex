require 'csv'
class TheouleRestaurantCustomersController < ApplicationController
  before_action :set_theoule_restaurant_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @theoule_restaurant_customers = TheouleRestaurantCustomer.theoule_restaurant_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @theoule_restaurant_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @theoule_restaurant_customers = TheouleRestaurantCustomer.all.paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @theoule_restaurant_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @theoule_restaurant_customer = TheouleRestaurantCustomer.new
  end

  def create
    @theoule_restaurant_customer = TheouleRestaurantCustomer.new(theoule_restaurant_customer_params)
    if @theoule_restaurant_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @theoule_restaurant_customer.update(theoule_restaurant_customer_params)
      redirect_to theoule_restaurant_customers_path
    else
      render :edit
    end
  end

  def clean
    @theoule_restaurant_customers = TheouleRestaurantCustomer.all
    @theoule_restaurant_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to theoule_restaurant_customers_path
  end

  def import
    TheouleRestaurantCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = TheouleRestaurantCustomer.theoule_restaurant_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @theoule_restaurant_customers = TheouleRestaurantCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_theoule_restaurant_customer
    @theoule_restaurant_customer = TheouleRestaurantCustomer.find(params[:id])
  end

  def theoule_restaurant_customer_params
    params.require(:theoule_restaurant_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
