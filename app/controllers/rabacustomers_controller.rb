class RabacustomersController < ApplicationController
  def index
    @rabacustomers = RabaCustomer.all
    respond_to do |format|
      format.html
      format.csv { send_data @rabacustomers.to_csv(['name', 'surname', 'email'])}
    end
  end

  def new
    @rabacustomer = RabaCustomer.new
  end

  def create
    @rabacustomer = RabaCustomer.new(rabacustomer_params)
    if @rabacustomer.save
      redirect_to root_path

    else
      render :new
    end
  end

  def import
    rabaCustomer.import(params[:file])
    redirect_to root_url, notice: 'rabacustomers imported.'
  end

  private

  def rabacustomer_params
    params.require(:rabacustomer).permit(:name, :mail)
  end
end
