require 'csv'
class RabaRoomCustomersController < ApplicationController
  before_action :set_raba_room_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @raba_room_customers = RabaRoomCustomer.raba_room_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @raba_room_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @raba_room_customers = RabaRoomCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @raba_room_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @raba_room_customer = RabaRoomCustomer.new
  end

  def create
    @raba_room_customer = RabaRoomCustomer.new(raba_room_customer_params)
    if @raba_room_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @porto_customer.update(porto_customer_params)
      redirect_to porto_customers_path
    else
      render :edit
    end
  end

  def import
    RabaRoomCustomer.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = RabaRoomCustomer.raba_room_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @raba_room_customers = RabaRoomCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private

  def set_raba_room_customer
    @raba_room_customer = RabaRoomCustomer.find(params[:id])
  end

  def raba_room_customer_params
    params.require(:raba_room_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe, :segment)
  end
end
