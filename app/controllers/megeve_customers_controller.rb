require 'csv'
class MegeveCustomersController < ApplicationController
  before_action :set_megeve_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @megeve_customers = MegeveCustomer.megeve_search(params[:search]).paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @megeve_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @megeve_customers = MegeveCustomer.all.paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @megeve_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @megeve_customer = MegeveCustomer.new
  end

  def create
    @megeve_customer = MegeveCustomer.new(megeve_customer_params)
    if @megeve_customer.save
      redirect_to root_path

    else
      render :new
    end
  end
  def edit

  end

  def update
    if @megeve_customer.update(megeve_customer_params)
    else
      render :edit
    end
  end

  def clean
    @megeve_customers = MegeveCustomer.all
    @megeve_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to megeve_customers_path
  end

  def import
    MegeveCustomer.import(params[:file])
    redirect_to root_url, notice: 'megeve_customers imported.'
  end

  def export
    if params[:search].present?
      @mimi_customers = MegeveCustomer.megeve_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @megeve_customers = MegeveCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_megeve_customer
    @megeve_customer = MegeveCustomer.find(params[:id])
  end

  def megeve_customer_params
    params.require(:megeve_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
