class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :orders

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_JP_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :password, format: { with: VALID_PASSWORD_REGEX }

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: VALID_JP_NAME_REGEX }
    validates :first_name, format: { with: VALID_JP_NAME_REGEX }
    validates :family_name_kana, format: { with: VALID_NAME_KANA_REGEX }
    validates :first_name_kana, format: { with: VALID_NAME_KANA_REGEX }
    validates :birth_date
  end
end
