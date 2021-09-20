class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :name, :description, :price
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipping_day_id
    end
    with_options foreign_key: true do
      validates :user
    end
  end
end
