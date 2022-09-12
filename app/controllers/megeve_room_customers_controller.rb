require 'csv'
class MegeveRoomCustomersController < ApplicationController
  before_action :set_megeve_room_customer, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @megeve_room_customers = MegeveRoomCustomer.megeve_room_search(params[:search]).paginate(page: params[:page], per_page: 30)
      respond_to do |format|
        format.html
        format.csv { send_data @megeve_room_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @megeve_room_customers = MegeveRoomCustomer.all.paginate(page: params[:page], per_page: 30)
      respond_to do |format|
        format.html
        format.csv { send_data @megeve_room_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @megeve_room_customer = MegeveRoomCustomer.new
  end

  def create
    @megeve_room_customer = MegeveRoomCustomer.new(megeve_room_customer_params)
    if @megeve_room_customer.save
      redirect_to root_path

    else
      render :new
    end
  end
  def edit

  end

  def update
    if @megeve_room_customer.update(megeve_room_customer_params)
    else
      render :edit
    end
  end

  def clean
    @megeve_room_customers = MegeveRoomCustomer.all
    @megeve_room_customers.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.unsubscribe = true
          rb.save!
        end
      end
    end
    redirect_to megeve_room_customers_path
  end

  def import
    MegeveRoomCustomer.import(params[:file])
    redirect_to root_url, notice: 'megeve_room_customers imported.'
  end

  def export
    if params[:search].present?
      @mimi_customers = MegeveRoomCustomer.megeve_room_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @megeve_room_customers = MegeveRoomCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_megeve_room_customer
    @megeve_room_customer = MegeveRoomCustomer.find(params[:id])
  end

  def megeve_room_customer_params
    params.require(:megeve_room_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe)
  end
end
