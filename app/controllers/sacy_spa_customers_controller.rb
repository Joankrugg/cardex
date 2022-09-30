require 'csv'
class SacySpaCustomersController < ApplicationController
  before_action :set_sacy_spa_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @sacy_spa_customers = SacySpaCustomer.sacy_spa_search(params[:search]).paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @sacy_spa_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @sacy_spa_customers = SacySpaCustomer.all.paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @sacy_spa_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @sacy_spa_customer = SacySpaCustomer.new
  end

  def create
    @sacy_spa_customer = SacySpaCustomer.new(sacy_spa_customer_params)
    if @sacy_spa_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @sacy_spa_customer.update(sacy_spa_customer_params)
      redirect_to sacy_spa_customers_path
    else
      render :edit
    end
  end

  def clean
    @sacy_spa_customers = SacySpaCustomer.all
    @sacy_spa_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to sacy_spa_customers_path
  end

  def import
    SacySpaCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = SacySpaCustomer.sacy_spa_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @sacy_spa_customers = SacySpaCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_sacy_spa_customer
    @sacy_spa_customer = SacySpaCustomer.find(params[:id])
  end

  def sacy_spa_customer_params
    params.require(:sacy_spa_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
