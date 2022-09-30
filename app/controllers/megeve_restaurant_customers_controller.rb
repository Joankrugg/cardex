require 'csv'
class MegeveRestaurantCustomersController < ApplicationController
  before_action :set_megeve_restaurant_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @megeve_restaurant_customers = MegeveRestaurantCustomer.megeve_restaurant_search(params[:search]).paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @megeve_restaurant_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @megeve_restaurant_customers = MegeveRestaurantCustomer.all.paginate(page: params[:page], per_page: 30)
      respond_to do |format|
        format.html
        format.csv { send_data @megeve_restaurant_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @megeve_restaurant_customer = MegeveRestaurantCustomer.new
  end

  def create
    @megeve_restaurant_customer = MegeveRestaurantCustomer.new(megeve_restaurant_customer_params)
    if @megeve_restaurant_customer.save
      redirect_to root_path

    else
      render :new
    end
  end
  def edit

  end

  def update
    if @megeve_restaurant_customer.update(megeve_restaurant_customer_params)
    else
      render :edit
    end
  end

  def clean
    @megeve_restaurant_customers = MegeveRestaurantCustomer.all
    @megeve_restaurant_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to megeve_restaurant_customers_path
  end

  def import
    MegeveRestaurantCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = MegeveRestaurantCustomer.megeve_restaurant_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @megeve_restaurant_customers = MegeveRestaurantCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_megeve_restaurant_customer
    @megeve_restaurant_customer = MegeveRestaurantCustomer.find(params[:id])
  end

  def megeve_restaurant_customer_params
    params.require(:megeve_restaurant_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
