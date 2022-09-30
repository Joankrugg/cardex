require 'csv'
class LeognanProCustomersController < ApplicationController
  before_action :set_leognan_pro_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @leognan_pro_customers = LeognanProCustomer.leognan_pro_search(params[:search]).paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @leognan_pro_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @leognan_pro_customers = LeognanProCustomer.all.paginate(page: params[:page], per_page: 30)
      respond_to do |format|
        format.html
        format.csv { send_data @leognan_pro_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @leognan_pro_customer = LeognanProCustomer.new
  end

  def create
    @leognan_pro_customer = LeognanProCustomer.new(leognan_pro_customer_params)
    if @leognan_pro_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @leognan_pro_customer.update(leognan_pro_customer_params)
      redirect_to leognan_pro_customers_path
    else
      render :edit
    end
  end

  def clean
    @leognan_pro_customers = LeognanProCustomer.all
    @leognan_pro_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to leognan_pro_customers_path
  end

  def import
    LeognanProCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = LeognanProCustomer.leognan_pro_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @leognan_pro_customers = LeognanProCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_leognan_pro_customer
    @leognan_pro_customer = LeognanProCustomer.find(params[:id])
  end

  def leognan_pro_customer_params
    params.require(:leognan_pro_customer).permit(:genre, :name, :surname, :zipcode, :city, :country, :email, :birth ,:subscribe, :unsubscribe)
  end
end
