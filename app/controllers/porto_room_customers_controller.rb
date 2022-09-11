require 'csv'
class PortoRoomCustomersController < ApplicationController
  before_action :set_porto_room_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @porto_room_customers = PortoRoomCustomer.porto_room_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @porto_room_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @porto_room_customers = PortoRoomCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @porto_room_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @porto_room_customer = PortoRoomCustomer.new
  end

  def create
    @porto_room_customer = PortoRoomCustomer.new(porto_room_customer_params)
    if @porto_room_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @porto_room_customer.update(porto_room_customer_params)
      redirect_to porto_room_customers_path
    else
      render :edit
    end
  end

  def clean
    @porto_room_customers = PortoRoomCustomer.all
    @porto_room_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to porto_room_customers_path
  end

  def import
    PortoRoomCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = PortoRoomCustomer.porto_room_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @porto_room_customers = PortoRoomCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_porto_room_customer
    @porto_room_customer = PortoRoomCustomer.find(params[:id])
  end

  def porto_room_customer_params
    params.require(:porto_room_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
