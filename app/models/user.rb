class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  #ceci est genener par la cmd r g devise:Model 
         
  validates :username, presence: true #(contrainte )
  validates :phone_number, presence: true

=begin
validates :titre, presence: true signifie que chaque annonce doit avoir un titre, ce champ ne peut pas être vide.

validates :prix, presence: true, numericality: { greater_than_or_equal_to: 0 } 
signifie que chaque annonce doit avoir un prix, et ce prix doit être un nombre positif ou nul.
=end
  
  has_many :annonces, dependent: :destroy  #definire les relation entre les modeles 
=begin


dependent: :destroy : Cela signifie que lorsqu'un utilisateur est supprimé, 
toutes ses annonces associées seront également supprimées automatiquement de la base de données. b7al foreing key cascade contrainte
=end
end