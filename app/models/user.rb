class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

           VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
         validates :password, format: { with: VALID_PASSWORD_REGEX }
         validates :nickname, presence: true
         validates :family_name, presence: true
         validates :first_name, presence: true
           VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
         validates :family_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
         validates :first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }

         validates :birth_date, presence: true



end
