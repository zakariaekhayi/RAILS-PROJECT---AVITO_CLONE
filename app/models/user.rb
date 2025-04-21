class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :username, presence: true
  validates :phone_number, presence: true
  
  has_many :annonces, dependent: :destroy
end