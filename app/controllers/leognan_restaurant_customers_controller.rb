require 'csv'
class LeognanRestaurantCustomersController < ApplicationController
  before_action :set_leognan_restaurant_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @leognan_restaurant_customers = LeognanRestaurantCustomer.leognan_restaurant_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @leognan_restaurant_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @leognan_restaurant_customers = LeognanRestaurantCustomer.all.paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @leognan_restaurant_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @leognan_restaurant_customer = LeognanRestaurantCustomer.new
  end

  def create
    @leognan_restaurant_customer = LeognanRestaurantCustomer.new(leognan_restaurant_customer_params)
    if @leognan_restaurant_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @leognan_restaurant_customer.update(leognan_restaurant_customer_params)
      redirect_to leognan_restaurant_customers_path
    else
      render :edit
    end
  end

  def clean
    @leognan_restaurant_customers = LeognanRestaurantCustomer.all
    @leognan_restaurant_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to leognan_restaurant_customers_path
  end

  def import
    LeognanRestaurantCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = LeognanRestaurantCustomer.leognan_restaurant_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @leognan_restaurant_customers = LeognanRestaurantCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_leognan_restaurant_customer
    @leognan_restaurant_customer = LeognanRestaurantCustomer.find(params[:id])
  end

  def leognan_restaurant_customer_params
    params.require(:leognan_restaurant_customer).permit(:genre, :name, :surname, :zipcode, :city, :country, :email, :birth ,:subscribe, :unsubscribe)
  end
end
