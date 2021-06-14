class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  before_action :move_to_top,        only: [:index, :create]
  before_action :move_to_index,      only: [:index, :create]
  

  def index
    @order_destination = OrderDestination.new
  end

  def create
    @products = Product.find(params[:product_id])
    @order_destination = OrderDestination.new(order_destination_params)
    if @order_destination.valid?
      pay_product
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_destination_params
    params.require(:order_destination)
          .permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number)
          .merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @products.price,
      card: order_destination_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if @products.order.present?
  end

  def move_to_top
    @products = Product.find(params[:product_id])
    redirect_to root_path if  @products.user_id == current_user.id
  end
end
