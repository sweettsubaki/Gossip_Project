Rails.application.routes.draw do
  
  root to: 'welcome#index'
  resources :comments
  resources :city
  resources :villes
  resources :gossip
  resources :user
  resources :welcome
  get 'contact', to: 'contact#show'
  get 'team', to: 'team#show'

end
