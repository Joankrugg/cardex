require 'csv'
class SacyRoomCustomersController < ApplicationController
  before_action :set_sacy_room_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @sacy_room_customers = SacyRoomCustomer.sacy_room_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @sacy_room_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @sacy_room_customers = SacyRoomCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @sacy_room_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @sacy_room_customer = SacyRoomCustomer.new
  end

  def create
    @sacy_room_customer = SacyRoomCustomer.new(sacy_room_customer_params)
    if @sacy_room_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @sacy_room_customer.update(sacy_room_customer_params)
      redirect_to sacy_room_customers_path
    else
      render :edit
    end
  end

  def clean
    @sacy_room_customers = SacyRoomCustomer.all
    @sacy_room_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to sacy_room_customers_path
  end

  def import
    SacyRoomCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = SacyRoomCustomer.sacy_room_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @sacy_room_customers = SacyRoomCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_sacy_room_customer
    @sacy_room_customer = SacyRoomCustomer.find(params[:id])
  end

  def sacy_room_customer_params
    params.require(:sacy_room_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
