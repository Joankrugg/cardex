require 'csv'
class SacyRestaurantCustomersController < ApplicationController
  before_action :set_sacy_restaurant_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @sacy_restaurant_customers = SacyRestaurantCustomer.sacy_restaurant_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @sacy_restaurant_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @sacy_restaurant_customers = SacyRestaurantCustomer.all.paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @sacy_restaurant_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @sacy_restaurant_customer = SacyRestaurantCustomer.new
  end

  def create
    @sacy_restaurant_customer = SacyRestaurantCustomer.new(sacy_restaurant_customer_params)
    if @sacy_restaurant_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @sacy_restaurant_customer.update(sacy_restaurant_customer_params)
      redirect_to sacy_restaurant_customers_path
    else
      render :edit
    end
  end

  def clean
    @sacy_restaurant_customers = SacyRestaurantCustomer.all
    @sacy_restaurant_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to sacy_restaurant_customers_path
  end

  def import
    SacyRestaurantCustomer.import(params[:file])
  end
  def export
    if params[:search].present?
      @mimi_customers = SacyRestaurantCustomer.sacy_restaurant_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @sacy_restaurant_customers = SacyRestaurantCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private
  def set_sacy_restaurant_customer
    @sacy_restaurant_customer = SacyRestaurantCustomer.find(params[:id])
  end
  def sacy_restaurant_customer_params
    params.require(:sacy_restaurant_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
