require 'csv'
class CustomListsController < ApplicationController
  before_action :set_custom_list, only: [ :edit, :update ]
  def index
    if params[:search].present?
      @custom_lists = CustomList.custom_search(params[:search]).paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @custom_list.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @custom_lists = CustomList.all.paginate(page: params[:page], per_page: 150)
      respond_to do |format|
        format.html
        format.csv { send_data @custom_list.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @custom_list = CustomList.new
  end

  def create
    @custom_list = CustomList.new(custom_list_params)
    if @custom_list.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit

  end

  def update
    if @custom_list.update(custom_list_params)
    else
      render :edit
    end
  end

  def clean
    @custom_lists = CustomList.all
    @custom_lists.each do |rb|
      if rb.email.present?
        if rb.email.include?('guest.booking.com') || rb.email.include?('expedia') || rb.email.include?('staycation.co')
          rb.destroy
        end
      end
    end
    redirect_to custom_lists_path
  end

  def import
    CustomList.import(params[:file])
  end

  def export
    if params[:search].present?
      @mimi_customers = CustomList.custom_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @custom_list = CustomList.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  private

  def set_custom_list
    @custom_list = CustomList.find(params[:id])
  end

  def custom_list_params
    params.require(:custom_list_customer).permit(:genre, :name, :surname, :email, :zipcode, :city, :country, :birth, :unsubscribe, :phone, :home, :address, :segment)
  end
end
