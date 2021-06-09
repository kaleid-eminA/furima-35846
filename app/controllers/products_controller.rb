class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_products,only: [:edit]


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

  def edit
    @products = Product.find(params[:id])
  end
  
  def update
    @products = Product.find(params[:id])
    if @products.update(products_params)
    redirect_to show
    else
      render :edit
  end
end

  


  private

  def products_params
    params.require(:product).permit(:name, :description, :condition_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id,
                                    :category_id, :price, :image).merge(user_id: current_user.id)
  end

  def correct_products
    @products = Product.find(params[:id])
  unless @products.user.id == current_user.id
    redirect_to root_path
  end
end
end
