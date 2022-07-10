require 'csv'
class SacyCustomersController < ApplicationController
  def index
    if params[:search].present?
      @sacy_customers = SacyCustomer.sacy_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @sacy_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @sacy_customers = SacyCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @sacy_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @sacy_customer = SacyCustomer.new
  end

  def create
    @sacy_customer = SacyCustomer.new(sacy_customer_params)
    if @sacy_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def import
    SacyCustomer.import(params[:file])
    redirect_to root_url, notice: 'sacy_customers imported.'
  end
  def export
    if params[:search].present?
      @mimi_customers = SacyCustomer.sacy_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @sacy_customers = SacyCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private

  def sacy_customer_params
    params.require(:sacy_customer).permit(:name, :mail)
  end
end
