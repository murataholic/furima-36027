class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city_ward_town_village,
                :house_number, :building_name, :telephone_number, :user_id, :item_id, :token

  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city_ward_town_village, :house_number
    validates :telephone_number, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :token, :user_id, :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(
      postal_code: postal_code, prefecture_id: prefecture,
      city_ward_town_village: city_ward_town_village, house_number: house_number,
      building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id
    )
  end
end
