class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_products, only: [:edit, :edit]
  before_action :set_product, only: [:edit, :show, :update, :correct_products]

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
  end

  def edit
  end

  def update
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

  def set_product
    @products = Product.find(params[:id])
  end

  def correct_products
    redirect_to root_path unless @products.user.id == current_user.id
  end
end
