require 'csv'
class GhsoSpaCustomersController < ApplicationController
  before_action :set_ghso_spa_customer, only: [ :edit, :update ]

  def index
    if params[:search].present?
      @ghso_spa_customers = GhsoSpaCustomer.ghso_spa_search(params[:search]).paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @ghso_spa_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @ghso_spa_customers = GhsoSpaCustomer.all.paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @ghso_spa_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @ghso_spa_customer = GhsoSpaCustomer.new
  end

  def create
    @ghso_spa_customer = GhsoSpaCustomer.new(ghso_spa_customer_params)
    if @ghso_spa_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @ghso_spa_customer.update(ghso_spa_customer_params)
      redirect_to ghso_spa_customers_path
    else
      render :edit
    end
  end

  def clean
    @ghso_spa_customers = GhsoSpaCustomer.all
    @ghso_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to ghso_spa_customers_path
  end

  def import
    GhsoSpaCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = GhsoSpaCustomer.ghso_spa_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @ghso_spa_customers = GhsoSpaCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private

  def set_ghso_spa_customer
    @ghso_spa_customer = GhsoSpaCustomer.find(params[:id])
  end

  def ghso_spa_customer_params
    params.require(:ghso_spa_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
