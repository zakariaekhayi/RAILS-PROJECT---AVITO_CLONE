class ApplicationController < ActionController::Base #est la classe pour tous les controlleru 
    helper_method :site_name, :region_name   #sont des methodes acceible dans tous les vues , et ne dois pas etre  declarer dans chaque controlleru
    #########je l'utilser dans devise/sessions/new.html.erb , dans connecter vous a votre market place voir le rapport la page de login 
    def self.site_name #c'est comme faire ApplicationController.site_name
      "VotreMarketplace" #cest methodes retourne tous simplement  la chaine "votreMarketplace"
    end
    
    def self.region_name
      "Maroc"
    end
  end