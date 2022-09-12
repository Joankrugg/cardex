require 'csv'
class BrindosSpaCustomersController < ApplicationController
  before_action :set_brindos_spa_customer, only: [ :edit, :update ]

  def index
    if params[:search].present?
      @brindos_spa_customers = BrindosSpaCustomer.brindos_spa_search(params[:search]).paginate(page: params[:page], per_page: 30)
      respond_to do |format|
        format.html
        format.csv { send_data @brindos_spa_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @brindos_spa_customers = BrindosSpaCustomer.all.paginate(page: params[:page], per_page: 30)
      respond_to do |format|
        format.html
        format.csv { send_data @brindos_spa_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @brindos_spa_customer = BrindosSpaCustomer.new
  end

  def create
    @brindos_spa_customer = BrindosSpaCustomer.new(brindos_spa_customer_params)
    if @brindos_spa_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @brindos_spa_customer.update(brindos_spa_customer_params)
      redirect_to brindos_spa_customers_path
    else
      render :edit
    end
  end

  def clean
    @brindos_spa_customers = BrindosSpaCustomer.all
    @brindos_spa_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to brindos_spa_customers_path
  end

  def import
    BrindosSpaCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = BrindosSpaCustomer.brindos_spa_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @brindos_spa_customers = BrindosSpaCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private

  def set_brindos_spa_customer
    @brindos_spa_customer = BrindosSpaCustomer.find(params[:id])
  end

  def brindos_spa_customer_params
    params.require(:brindos_spa_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
