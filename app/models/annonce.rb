class Annonce < ApplicationRecord
  belongs_to :user
  
  validates :titre, presence: true
  validates :prix, presence: true, numericality: { greater_than_or_equal_to: 0 }
end