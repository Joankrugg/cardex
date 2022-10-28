require 'csv'
class MillesimeCustomersController < ApplicationController
  before_action :set_millesime_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @millesime_customers = MillesimeCustomer.millesime_search(params[:search]).paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @millesime_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @millesime_customers = MillesimeCustomer.all.paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @millesime_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @millesime_customer = MillesimeCustomer.new
  end

  def create
    @millesime_customer = MillesimeCustomer.new(millesime_customer_params)
    if @millesime_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @millesime_customer.update(millesime_customer_params)
    else
      render :edit
    end
  end

  def clean
    @millesime_customers = MillesimeCustomer.all
    @millesime_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to millesime_customers_path
  end

  def import
    MillesimeCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = MillesimeCustomer.millesime_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @millesime_customers = MillesimeCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_millesime_customer
    @millesime_customer = MillesimeCustomer.find(params[:id])
  end

  def millesime_customer_params
    params.require(:millesime_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe, :phone, :home, :address, :segment)
  end
end



