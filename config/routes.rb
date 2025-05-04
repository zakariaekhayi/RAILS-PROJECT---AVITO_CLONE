Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  #devise creee automatiquement tous routes necessaire de s'inscrire se connecter  mot de passe oublie 
  #  devise_for: users =>tu dit a l'utilisateur a Rails "Je veux utiliser Devise pour gérer les utilisateurs (Users dans le model)", s'inscrire  , Devise va automatiquement créer toutes les routes nécessaires pour : s'insrier
=begin
controllers: { registrations: 'users/registrations' } ➔
Normalement, Devise utilise ses propres contrôleurs internes (Devise::RegistrationsController) pour gérer les inscriptions.
Là, tu lui dis :
➔ « Attention ! N'utilise pas ton contrôleur par défaut pour les inscriptions ! Utilise mon propre contrôleur personnalisé »
➔ Ton contrôleur personnalisé est Users::RegistrationsController (dans app/controllers/users/registrations_controller.rb).

Pourquoi faire ça ? ➔
Parce que tu veux sûrement modifier le comportement de l'inscription, par exemple :

1-ajouter des champs supplémentaires (nom, prénom, téléphone, etc.)

changer ce qui se passe après l'inscription

ajouter des vérifications spéciales

et 
On peut pas ecrire   quelle_que_chose:  car devise attent les cles de hash  prediefinies pour lui c'est registreations et sessions et passwords
devise_for :users, controllers: {
  quelle_que_chose: 'users/registrations', # personnalisé
  
}
=end



  resources :annonces do
    collection do
      get 'mes_annonces'  #j'ai pas fait dans la personnalistion de la route mes annonces comme : get 'mes_annonces', to: 'annonces#mes_annonces'  car j'ai deja fait dans ressources annonces donc rails comprend ceci automatiquement 
      get 'search'
    end
  end
  

=begin
Récapitulatif des routes :
Standard routes générées par resources :annonces :

GET /annonces → annonces#index

GET /annonces/:id → annonces#show

GET /annonces/new → annonces#new

POST /annonces → annonces#create

GET /annonces/:id/edit → annonces#edit

PATCH/PUT /annonces/:id → annonces#update

DELETE /annonces/:id → annonces#destroy

Route personnalisée :

GET /annonces/mes_annonces → annonces#mes_annonces
=end
  
  root 'home#index'  #mapper la route / du port 3000 a l'action (fonction) index a  home_controller 

  get 'index2', to: 'home#index2' #je veux mapper  la route index2 a une action index2 existe dans le controlleur home_controller 



  get 'newannonces', to: 'annonces#new'


end