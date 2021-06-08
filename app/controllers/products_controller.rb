class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @products = Product.order('created_at DESC')
  end

  def new
    @products = Product.new
  end

  def create
    @products = Product.new(products_params)
    if @products.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @products = Product.find(params[:id])
  end

  private

  def products_params
    params.require(:product).permit(:name, :description, :condition_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id,
                                    :category_id, :price, :image).merge(user_id: current_user.id)
  end
end
