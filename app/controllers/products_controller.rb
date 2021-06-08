class ProductsController < ApplicationController
  def index
    
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

  private

  def products_params
    params.require(:product).permit(:name, :description, :condition_id, :shipping_costs_id, :prefecture_id, :days_to_ships_id,
                                    :categories_id, :price, :image).merge(user_id: current_user.id)
  end
end
