class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city_ward_town_village, :house_number, :building_name, :telephone_number, :user_id, :item_id, :purchase_id 
end