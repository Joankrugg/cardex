require 'csv'
class FrancophoneCustomersController < ApplicationController
  before_action :set_francophone_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @francophone_customers = FrancophoneCustomer.francophone_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @francophone_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @francophone_customers = FrancophoneCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @francophone_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @francophone_customer = FrancophoneCustomer.new
  end

  def create
    @francophone_customer = FrancophoneCustomer.new(francophone_customer_params)
    if @francophone_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @francophone_customer.update(francophone_customer_params)
      redirect_to francophone_customers_path
    else
      render :edit
    end
  end

  def clean
    @francophone_customers = FrancophoneCustomer.all
    @francophone_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to francophone_customers_path
  end

  def import
    FrancophoneCustomer.import(params[:file])
    redirect_to root_url, notice: 'francophone_customers imported.'
  end

  def export
    if params[:search].present?
      @mimi_customers = FrancophoneCustomer.francophone_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @francophone_customers = FrancophoneCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_francophone_customer
    @francophone_customer = FrancophoneCustomer.find(params[:id])
  end

  def francophone_customer_params
    params.require(:francophone_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
