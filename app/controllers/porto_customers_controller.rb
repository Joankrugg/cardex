require 'csv'
class PortoCustomersController < ApplicationController
  before_action :set_porto_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @porto_customers = PortoCustomer.porto_search(params[:search]).paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @porto_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @porto_customers = PortoCustomer.all.paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @porto_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @porto_customer = PortoCustomer.new
  end

  def create
    @porto_customer = PortoCustomer.new(porto_customer_params)
    if @porto_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @porto_customer.update(porto_customer_params)
      redirect_to porto_customers_path
    else
      render :edit
    end
  end

  def clean
    @porto_customers = PortoCustomer.all
    @porto_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to porto_customers_path
  end

  def import
    PortoCustomer.import(params[:file])
    redirect_to root_url, notice: 'porto_customers imported.'
  end

  def export
    if params[:search].present?
      @mimi_customers = PortoCustomer.porto_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @porto_customers = PortoCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_porto_customer
    @porto_customer = PortoCustomer.find(params[:id])
  end

  def porto_customer_params
    params.require(:porto_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
