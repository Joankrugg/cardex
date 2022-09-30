require 'csv'
class TheouleBeachCustomersController < ApplicationController
  before_action :set_theoule_beach_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @theoule_beach_customers = TheouleBeachCustomer.theoule_beach_search(params[:search]).paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @theoule_beach_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @theoule_beach_customers = TheouleBeachCustomer.all.paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @theoule_beach_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @theoule_beach_customer = TheouleBeachCustomer.new
  end

  def create
    @theoule_beach_customer = TheouleBeachCustomer.new(theoule_beach_customer_params)
    if @theoule_beach_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @theoule_beach_customer.update(theoule_beach_customer_params)
      redirect_to theoule_beach_customers_path
    else
      render :edit
    end
  end

  def clean
    @theoule_beach_customers = TheouleBeachCustomer.all
    @theoule_beach_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to theoule_beach_customers_path
  end

  def import
    TheouleBeachCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = TheouleBeachCustomer.theoule_beach_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @theoule_beach_customers = TheouleBeachCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_theoule_beach_customer
    @theoule_beach_customer = TheouleBeachCustomer.find(params[:id])
  end

  def theoule_beach_customer_params
    params.require(:theoule_beach_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
