require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)

  end

  describe '商品を出品する' do
    context '商品を出品できるとき' do
      it '入力不備がなければ出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できないとき' do
      it '商品画像がない場合、出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '「商品名」欄が空の場合、出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '「商品の説明」欄が空の場合、出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '「カテゴリー」欄が空の場合、出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '「カテゴリー」欄が初期値（---）の場合、出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '「商品の状態」欄が空の場合、出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '「商品の状態」欄が初期値（---）の場合、出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '「配送料の負担」欄が空の場合、出品できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it '「配送料の負担」欄が初期値（---）の場合、出品できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it '「発送元の地域」欄が空の場合、出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '「発送元の地域」欄が初期値（---）の場合、出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '「発送までの日数」欄が空の場合、出品できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '「発送までの日数」欄が初期値（---）の場合、出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '「価格」欄が空の場合、出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '「価格」欄に全角数字が入力されている場合、出品できない' do
        @item.price = '４００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it '「価格」欄に半角文字が含まれる場合、出品できない' do
        @item.price = '30000dollar'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it '「価格」欄に全角文字が含まれる場合、出品できない' do
        @item.price = '3万円'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it '「価格」欄に小数が入力されている場合、出品できない' do
        @item.price = '1234.5'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it '「価格」が「300未満」の場合、出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it '「価格」が「1000万以上」の場合、出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'ユーザーが紐付いていない場合、出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
