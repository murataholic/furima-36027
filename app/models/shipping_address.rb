class ShippingAddress < ApplicationRecord
  belongs_to :purchase

  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :telephone_number, presence: true, format: { with: /\A\d{10}$|^\d{11}\z/, message: "is invalid. Don't include hyphen(-) nor do use full-width characters" }
end
