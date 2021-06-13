class OrdersController < ApplicationController
  def index
    @order_destination = OrderDestination.new
    @products = Product.find(params[:product_id])
  end

  def create

    @products = Product.find(params[:product_id])
    @order_destination = OrderDestination.new(order_destination_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_destination_params
    params.require(:order_destination)
    .permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :price)
    .merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
