require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, user_id: user.id)
  end

  describe '商品を購入する' do
    context '商品を購入できるとき' do
      it '入力不備がなくtoken情報があれば購入できる' do
        expect(@purchase_shipping_address).to be_valid
      end
      it '「建物名」が空でも購入できる' do
        @purchase_shipping_address.building_name = ''
        expect(@purchase_shipping_address).to be_valid
      end
    end

    context '商品を購入できないとき' do
      it '「郵便番号」が空の場合、購入できない' do
        @purchase_shipping_address.postal_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '「郵便番号」がハイフン（-）を含んだ正しい形式でない場合、購入できない' do
        @purchase_shipping_address.postal_code = '1234567'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '「都道府県」が空の場合、購入できない' do
        @purchase_shipping_address.prefecture = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '「都道府県」が初期値（---）の場合、購入できない' do
        @purchase_shipping_address.prefecture = 1
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '「市区町村」が空の場合、購入できない' do
        @purchase_shipping_address.city_ward_town_village = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("City ward town village can't be blank")
      end
      it '「番地」が空の場合、購入できない' do
        @purchase_shipping_address.house_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("House number can't be blank")
      end
      it '「電話番号」が空の場合、購入できない' do
        @purchase_shipping_address.telephone_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '「電話番号」が10ケタ未満の場合、購入できない' do
        @purchase_shipping_address.telephone_number = '123456789'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it '「電話番号」に半角数字以外の文字が含まれる場合、購入できない' do
        @purchase_shipping_address.telephone_number = '００-００００-００００'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it '「token」が空の場合、購入できない' do
        @purchase_shipping_address.token = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it '「user」が紐づいていない場合、購入できない' do
        @purchase_shipping_address.user_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
