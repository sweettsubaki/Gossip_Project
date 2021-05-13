Rails.application.routes.draw do
  
  
  root to: 'welcome#index'
  resources :session
  resources :city
  resources :gossip do
    resources :comments
  end
  resources :user
  resources :welcome
  get 'contact', to: 'contact#show'
  get 'team', to: 'team#show'

end
