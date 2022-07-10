require 'csv'
class PortoCustomersController < ApplicationController
  def index
    if params[:search].present?
      @porto_customers = PortoCustomer.porto_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @porto_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @porto_customers = PortoCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @porto_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @porto_customer = PortoCustomer.new
  end

  def create
    @porto_customer = PortoCustomer.new(porto_customer_params)
    if @porto_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def import
    PortoCustomer.import(params[:file])
    redirect_to root_url, notice: 'porto_customers imported.'
  end
  def export
    if params[:search].present?
      @mimi_customers = PortoCustomer.porto_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @porto_customers = PortoCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private

  def porto_customer_params
    params.require(:porto_customer).permit(:name, :mail)
  end
end
