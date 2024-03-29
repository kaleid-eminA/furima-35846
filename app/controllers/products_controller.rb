class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :correct_products, only: [:edit, :update, :destroy]
  before_action :products_order_root, only: [:edit, :update]

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
      redirect_to product_path(@products.id)
    else
      render :edit
    end
  end

  def destroy
    @products.destroy
    redirect_to root_path
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

  def products_order_root
    redirect_to root_path if @products.order.present?
  end
end
