require 'csv'
class BrindosProCustomersController < ApplicationController
  before_action :set_brindos_pro_customer, only: [ :edit, :update ]

  def index
    if params[:search].present?
      @brindos_pro_customers = BrindosProCustomer.brindos_pro_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @brindos_pro_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @brindos_pro_customers = BrindosProCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @brindos_pro_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @brindos_pro_customer = BrindosProCustomer.new
  end

  def create
    @brindos_pro_customer = BrindosProCustomer.new(brindos_pro_customer_params)
    if @brindos_pro_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @brindos_pro_customer.update(brindos_pro_customer_params)
      redirect_to brindos_pro_customers_path
    else
      render :edit
    end
  end

  def clean
    @brindos_customers = BrindosCustomer.all
    @brindos_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to brindos_customers_path
  end

  def import
    BrindosProCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = BrindosProCustomer.brindos_pro_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @brindos_pro_customers = BrindosProCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private

  def set_brindos_pro_customer
    @brindos_pro_customer = BrindosProCustomer.find(params[:id])
  end

  def brindos_pro_customer_params
    params.require(:brindos_pro_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
