class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: :index
  before_action :move_to_index, only: :index
  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def new
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    if @purchase_shipping_address.valid?
      @purchase_shipping_address.save
      redirect_to root_path
    else
      set_item
      render :index
    end
  end

  private

  def move_to_index
    if @item.purchase || current_user == @item.user
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :prefecture, :city_ward_town_village, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end