class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipping_address
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
end
