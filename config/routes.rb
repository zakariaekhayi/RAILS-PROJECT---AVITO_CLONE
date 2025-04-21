Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  resources :annonces do
    collection do
      get 'mes_annonces'
    end
  end
  
  root 'home#index'

  get 'index2', to: 'home#index2'

  get 'newannonces', to: 'annonces#new'


end