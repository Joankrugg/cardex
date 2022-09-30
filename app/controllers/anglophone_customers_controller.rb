require 'csv'
class AnglophoneCustomersController < ApplicationController
  before_action :set_anglophone_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @anglophone_customers = AnglophoneCustomer.anglophone_search(params[:search]).paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @anglophone_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @anglophone_customers = AnglophoneCustomer.all.paginate(page: params[:page], per_page: 30)
      respond_to do |format|
        format.html
        format.csv { send_data @anglophone_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @anglophone_customer = AnglophoneCustomer.new
  end

  def create
    @anglophone_customer = AnglophoneCustomer.new(anglophone_customer_params)
    if @anglophone_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @anglophone_customer.update(anglophone_customer_params)
      redirect_to anglophone_customers_path
    else
      render :edit
    end
  end

  def clean
    @anglophone_customers = AnglophoneCustomer.all
    @anglophone_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to anglophone_customers_path
  end

  def import
    AnglophoneCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = AnglophoneCustomer.anglophone_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @anglophone_customers = AnglophoneCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_anglophone_customer
    @anglophone_customer = AnglophoneCustomer.find(params[:id])
  end

  def anglophone_customer_params
    params.require(:anglophone_customer).permit(:genre, :name, :surname, :zipcode, :city, :country, :email, :birth, :segment, :phone, :home, :unsubscribe)
  end
end
