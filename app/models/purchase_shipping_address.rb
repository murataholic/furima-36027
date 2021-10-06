class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city_ward_town_village, :house_number, :building_name, :telephone_number, :user_id, :item_id, :purchase_id

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, format: { with: /\A\d{10}$|^\d{11}\z/, message: "is invalid. Don't include hyphen(-) nor do use full-width characters" }
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city_ward_town_village: city_ward_town_village, house_number: house_number, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end