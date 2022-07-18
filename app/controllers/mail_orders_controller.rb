class MailOrdersController < ApplicationController
  before_action :set_mail_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def new
    @user = current_user
    @mail_order = MailOrder.new
  end

  def create
    @user = current_user
    @mail_order = @user.mail_orders.new(mail_order_params)
    @mail_order.user = @user
    if
      @mail_order.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @mail_order.update(mail_order_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @mail_order.destroy
    redirect_to root_path
  end

  private

  def set_mail_order
    @mail_order = MailOrder.find(params[:id])
  end

  def mail_order_params
    params.require(:mail_order).permit(:title, :send_date, :text, :goal, :photo)
  end

end
