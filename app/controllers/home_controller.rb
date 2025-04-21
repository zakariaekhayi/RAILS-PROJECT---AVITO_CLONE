class HomeController < ApplicationController
  def index
    @annonces = Annonce.order(created_at: :desc).limit(6) # Affiche les 6 dernières annonces
  end
  def index2
    @annonces = Annonce.order(created_at: :desc).limit(6) # Affiche les 6 dernières annonces
  end
end