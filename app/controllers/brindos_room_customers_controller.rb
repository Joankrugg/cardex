require 'csv'
class BrindosRoomCustomersController < ApplicationController
  before_action :set_brindos_room_customer, only: [ :edit, :update ]

  def index
    if params[:search].present?
      @brindos_room_customers = BrindosRoomCustomer.brindos_room_search(params[:search]).paginate(page: params[:page], per_page: 30)
      respond_to do |format|
        format.html
        format.csv { send_data @brindos_room_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @brindos_room_customers = BrindosRoomCustomer.all.paginate(page: params[:page], per_page: 30)
      respond_to do |format|
        format.html
        format.csv { send_data @brindos_room_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @brindos_room_customer = BrindosRoomCustomer.new
  end

  def create
    @brindos_room_customer = BrindosRoomCustomer.new(brindos_room_customer_params)
    if @brindos_room_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @brindos_room_customer.update(brindos_room_customer_params)
      redirect_to brindos_room_customers_path
    else
      render :edit
    end
  end

  def clean
    @brindos_room_customers = BrindosRoomCustomer.all
    @brindos_room_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to brindos_room_customers_path
  end

  def import
    BrindosRoomCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = BrindosRoomCustomer.brindos_room_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @brindos_room_customers = BrindosRoomCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private

  def set_brindos_room_customer
    @brindos_room_customer = BrindosRoomCustomer.find(params[:id])
  end

  def brindos_room_customer_params
    params.require(:brindos_room_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
