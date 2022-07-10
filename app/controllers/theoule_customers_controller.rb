require 'csv'
class TheouleCustomersController < ApplicationController
  def index
    if params[:search].present?
      @theoule_customers = TheouleCustomer.theoule_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @theoule_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @theoule_customers = TheouleCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @theoule_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @theoule_customer = TheouleCustomer.new
  end

  def create
    @theoule_customer = TheouleCustomer.new(theoule_customer_params)
    if @theoule_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def import
    TheouleCustomer.import(params[:file])
    redirect_to root_url, notice: 'theoule_customers imported.'
  end
  def export
    if params[:search].present?
      @mimi_customers = TheouleCustomer.theoule_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @theoule_customers = TheouleCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private

  def theoule_customer_params
    params.require(:theoule_customer).permit(:name, :mail)
  end
end
