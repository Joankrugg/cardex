require 'csv'
class MegeveCustomersController < ApplicationController
  def index
    if params[:search].present?
      @megeve_customers = MegeveCustomer.megeve_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @megeve_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @megeve_customers = MegeveCustomer.all
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

  def megeve_customer_params
    params.require(:megeve_customer).permit(:name, :mail)
  end
end
