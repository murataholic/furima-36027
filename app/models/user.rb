class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases
  # has_many :comments

  validates :nickname,                presence: true
  validates :first_name_zenkaku,      presence: true
  validates :last_name_zenkaku,       presence: true
  validates :f_name_zenkaku_katakana, presence: true
  validates :l_name_zenkaku_katakana, presence: true
  validates :date_of_birth,           presence: true
end
