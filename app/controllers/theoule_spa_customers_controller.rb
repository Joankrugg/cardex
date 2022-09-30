require 'csv'
class TheouleSpaCustomersController < ApplicationController
  before_action :set_theoule_spa_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @theoule_spa_customers = TheouleSpaCustomer.theoule_spa_search(params[:search]).paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @theoule_spa_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @theoule_spa_customers = TheouleSpaCustomer.all.paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @theoule_spa_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @theoule_spa_customer = TheouleSpaCustomer.new
  end

  def create
    @theoule_spa_customer = TheouleSpaCustomer.new(theoule_spa_customer_params)
    if @theoule_spa_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @theoule_spa_customer.update(theoule_spa_customer_params)
      redirect_to theoule_spa_customers_path
    else
      render :edit
    end
  end

  def clean
    @theoule_spa_customers = TheouleSpaCustomer.all
    @theoule_spa_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to theoule_spa_customers_path
  end

  def import
    TheouleSpaCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = TheouleSpaCustomer.theoule_spa_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @theoule_spa_customers = TheouleSpaCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_theoule_spa_customer
    @theoule_spa_customer = TheouleSpaCustomer.find(params[:id])
  end

  def theoule_spa_customer_params
    params.require(:theoule_spa_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
