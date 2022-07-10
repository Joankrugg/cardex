require 'csv'
class LeognanCustomersController < ApplicationController
  def index
    if params[:search].present?
      @leognan_customers = LeognanCustomer.leognan_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @leognan_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @leognan_customers = LeognanCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @leognan_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end

  def new
    @leognan_customer = LeognanCustomer.new
  end

  def create
    @leognan_customer = LeognanCustomer.new(leognan_customer_params)
    if @leognan_customer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def import
    LeognanCustomer.import(params[:file])
    redirect_to root_url, notice: 'leognan_customers imported.'
  end
  def export
    if params[:search].present?
      @mimi_customers = LeognanCustomer.leognan_search(params[:search])
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    else
      @leognan_customers = LeognanCustomer.all
      respond_to do |format|
        format.html
        format.csv { send_data @mimi_customers.to_csv(['name', 'email', 'genre', 'city', 'country'])}
      end
    end
  end
  private

  def leognan_customer_params
    params.require(:leognan_customer).permit(:name, :mail)
  end
end
