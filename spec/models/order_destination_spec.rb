require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '#' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @destination = FactoryBot.build(:order_destination, user_id: user.id, product_id: product.id)
      sleep 0.1
    end
    context '購入できないとき' do
      it '郵便番号が無いと購入できない' do
        @destination.post_code = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は3桁-4桁でなければ購入できない' do
        @destination.post_code = '1111111'
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Post code is invalid")
      end
      it '郵便番号は半角文字列でなければ購入できない' do
        @destination.post_code = '３７０−０５３４'
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県がなければ購入できない' do
        @destination.prefecture_id = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村がなけれ購入できない' do
        @destination.city = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("City can't be blank")
      end
      it '番地がなければ購入できない' do
        @destination.address = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がなければ購入できない' do
        @destination.phone_number = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は10桁未満では購入できない' do
        @destination.phone_number = '123456789'
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号は12桁以上では購入できない' do
        @destination.phone_number = '112233445566'
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号は半角数字以外では購入できない' do
        @destination.phone_number = '０８０１２１２３４３４'
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Phone number is invalid")
      end
    end

    context '購入できるとき' do
      it '郵便番号が半角数字とハイフン（3桁-4桁）であれば購入できる' do
        @destination.post_code = '370-0534'
          expect(@destination).to be_valid
      end
      it '都道府県が選択されていれば購入できる' do
        @destination.prefecture_id = 11
          expect(@destination).to be_valid
      end
      it '市区町村があれば購入できる' do
        @destination.city = '邑楽郡大泉町丘山'
        expect(@destination).to be_valid
      end
      it '番地があれば購入できる' do
        @destination.address = '29-3'
          expect(@destination).to be_valid
      end
      it '建物名は任意である(入力ver)' do
        @destination.building_name = '総合ビル F3 ２０３号室'
        expect(@destination).to be_valid
      end
      it '建物名は任意である(無し ver)' do
        @destination.building_name = nil
          expect(@destination).to be_valid
      end
      it '電話番号が10桁以上11桁以下の半角数字であれば購入できる' do
        @destination.phone_number = '08041217272'
          expect(@destination).to be_valid
      end
    end
  end
end
