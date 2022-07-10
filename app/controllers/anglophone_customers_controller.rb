require 'csv'
class AnglophoneCustomersController < ApplicationController
  def index
    if params[:search].present?
      @anglophone_customers = AnglophoneCustomer.anglophone_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @anglophone_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @anglophone_customers = AnglophoneCustomer.all
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

  def import
    AnglophoneCustomer.import(params[:file])
    redirect_to root_url, notice: 'anglophone_customers imported.'
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

  def anglophone_customer_params
    params.require(:anglophone_customer).permit(:name, :mail)
  end
end
