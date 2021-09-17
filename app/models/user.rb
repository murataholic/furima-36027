class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :items (商品出品機能の実装時にコメントアウトを解除)
  # has_many :purchases (商品購入機能の実装時にコメントアウトを解除)
  # has_many :comments

  with_options presence: true do
    validates :nickname
    validates :date_of_birth

    with_options format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/} do
    validates :password
    end

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
      validates :first_name_zenkaku
      validates :last_name_zenkaku
    end

    with_options format: { with: /\A[ァ-ヶ々ー]+\z/ } do
      validates :f_name_zenkaku_katakana
      validates :l_name_zenkaku_katakana
    end

  end
end
