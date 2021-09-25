class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :image, :name, :description
    validates :price, numericality: { only_integer: true,
                                      greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipping_day_id
    end
  end
end
