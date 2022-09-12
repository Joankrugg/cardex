require 'csv'
class RabaSpaCustomersController < ApplicationController
  before_action :set_raba_spa_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @raba_spa_customers = RabaSpaCustomer.raba_spa_search(params[:search]).paginate(page: params[:page], per_page: 30)
      respond_to do |format|
        format.html
        format.csv { send_data @raba_spa_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @raba_spa_customers = RabaSpaCustomer.all.paginate(page: params[:page], per_page: 30)
      respond_to do |format|
        format.html
        format.csv { send_data @raba_spa_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @raba_spa_customer = RabaSpaCustomer.new
  end

  def create
    @raba_spa_customer = RabaSpaCustomer.new(raba_spa_customer_params)
    if @raba_spa_customer.save
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
    @raba_spa_customers = RabaSpaCustomer.all
    @raba_spa_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to raba_spa_customers_path
  end

  def import
    RabaSpaCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = RabaSpaCustomer.raba_spa_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @raba_spa_customers = RabaSpaCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private

  def set_raba_spa_customer
    @raba_spa_customer = RabaSpaCustomer.find(params[:id])
  end

  def raba_spa_customer_params
    params.require(:raba_spa_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe, :segment)
  end
end
