require 'csv'
class BrindosCustomersController < ApplicationController
  before_action :set_brindos_customer, only: [ :edit, :update ]

  def index
    if params[:search].present?
      @brindos_customers = BrindosCustomer.brindos_search(params[:search]).paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @brindos_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @brindos_customers = BrindosCustomer.all.paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @brindos_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @brindos_customer = BrindosCustomer.new
  end

  def create
    @brindos_customer = BrindosCustomer.new(brindos_customer_params)
    if @brindos_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @brindos_customer.update(brindos_customer_params)
      redirect_to brindos_customers_path
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
    BrindosCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = BrindosCustomer.brindos_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @brindos_customers = BrindosCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private

  def set_brindos_customer
    @brindos_customer = BrindosCustomer.find(params[:id])
  end

  def brindos_customer_params
    params.require(:brindos_customer).permit(:genre, :name, :surname, :email, :country, :zipcode, :city, :birth, :phone, :unsubscribe)
  end
end
