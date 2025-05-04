class Annonce < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  validates :titre, presence: true #  veut dire que titre doit etre forcement dasn l'anonce sinon erreur
  validates :prix, presence: true, numericality: { greater_than_or_equal_to: 0 } # il faut que le prix soit numerique et >0 forcement
  
  # Validation optionnelle pour le type de fichier image
  validate :acceptable_image
  
  private
  
  def acceptable_image
    return unless image.attached?
    
    # Vérifie que le fichier est bien une image
    unless image.blob.content_type.start_with?('image/')
      errors.add(:image, 'doit être une image (JPG, PNG, etc.)')
    end
    
    # Vérifie que la taille de l'image ne dépasse pas 5MB
    if image.blob.byte_size > 5.megabytes
      errors.add(:image, 'est trop volumineuse (max 5MB)')
    end
  end
end