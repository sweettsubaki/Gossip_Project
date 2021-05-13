Rails.application.routes.draw do
  
  resources :city
  resources :villes
  resources :gossip
  resources :user
  resources :welcome
  get 'contact', to: 'contact#show'
  get 'team', to: 'team#show'

end
