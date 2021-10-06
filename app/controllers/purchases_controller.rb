class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    @purchase = Purchase.create(purchase_params)
    ShippingAddress.create(shipping_address_params)
    redirect_to root_path
  end

  private

  def purchase_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def shipping_address_params
    params.permit(:postal_code, :prefecture_id, :city_ward_town_village, :house_number, :building_name, :telephone_number).merge(purchase_id: @purchase.id)
  end
end