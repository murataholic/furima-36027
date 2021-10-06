class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    if @purchase_shipping_address.valid?
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :prefecture_id, :city_ward_town_village, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id)
  end

end