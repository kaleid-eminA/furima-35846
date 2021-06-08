require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '出品できるとき' do
    before do
      @product = FactoryBot.build(:product)
      end
    context '出品できないとき' do
      it '商品画像を一枚つけてないと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @product.description = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーを選択しないと出品できない' do
        @product.categories_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Categories can't be blank")
      end
      it '商品の状態を選択しないと出品できない' do
        @product.condition_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担を選択しないと出品できない' do
        @product.shipping_costs_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping costs can't be blank")
      end
      it '発送元の地域を選択しないと出品できない' do
        @product.prefecture_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数を選択しないと出品できない' do
        @product.days_to_ships_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Days to ships can't be blank")
      end
      it '価格を入れないと出品できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は299以下では出品できない' do
        @product.price = '100'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格は10000000以上では出品できない' do
        @product.price = '999999999'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 99999999")
      end
      it '価格は半角数字以外では出品できない' do
        @product.price = '１２００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end

      context '登録ができるとき'
      it 'すべての項目が存在すれば出品できる' do
        expect(@product).to be_valid
      end
      it '商品画像が一枚ついていると出品できる' do
        @product = FactoryBot.build(:product, image: @product.image)
        expect(@product).to be_valid
      end
      it '商品名があると出品できる' do
        @product.name = '商品の名前'
        expect(@product).to be_valid
      end
      it '商品の説明があると出品できる' do
        @product.name = '商品の説明'
        expect(@product).to be_valid
      end
      it 'カテゴリーを選択すると出品できる' do
        @product.name = '3'
        expect(@product).to be_valid
      end
      it '商品の状態を選択すると出品できる' do
        @product.name = '3'
        expect(@product).to be_valid
      end
      it '配送料の負担を選択すると出品できる' do
        @product.name = '3'
        expect(@product).to be_valid
      end
      it '発送元の地域を選択すると出品できる' do
        @product.name = '3'
        expect(@product).to be_valid
      end
      it '発送までの日数を選択すると出品できる' do
        @product.name = '3'
        expect(@product).to be_valid
      end
      it '300-9999999の間で価格を入れると出品できる' do
        @product.name = '5000'
        expect(@product).to be_valid
      end
      it '価格は半角数字で入力すれば出品できる' do
        @product.name = '8000'
        expect(@product).to be_valid
      end
    end
  end
end