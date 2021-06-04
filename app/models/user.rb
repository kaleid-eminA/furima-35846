class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

           VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
         validates :email, uniqueness: true, presence: true
           VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
         validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
         validates :password_confirmation, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
         validates :nickname, presence: true
         validates :famiry_name, presence: true
         validates :first_name, presence: true
         validates :famiry_name_kana, presence: true
         validates :first_name_kana, presence: true
         validates :birth_date, presence: true



end
