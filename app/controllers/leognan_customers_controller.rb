require 'csv'
class LeognanCustomersController < ApplicationController
  before_action :set_leognan_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @leognan_customers = LeognanCustomer.leognan_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @leognan_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @leognan_customers = LeognanCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @leognan_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @leognan_customer = LeognanCustomer.new
  end

  def create
    @leognan_customer = LeognanCustomer.new(leognan_customer_params)
    if @leognan_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @leognan_customer.update(leognan_customer_params)
      redirect_to leognan_customers_path
    else
      render :edit
    end
  end

  def clean
    @leognan_customers = LeognanCustomer.all
    @leognan_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to leognan_customers_path
  end

  def import
    LeognanCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = LeognanCustomer.leognan_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @leognan_customers = LeognanCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_leognan_customer
    @leognan_customer = LeognanCustomer.find(params[:id])
  end

  def leognan_customer_params
    params.require(:leognan_customer).permit(:genre, :name, :surname, :zipcode, :city, :country, :email, :birth ,:subscribe, :unsubscribe)
  end
end

