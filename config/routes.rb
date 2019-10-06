Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"
  

resources :admin
resources :profile
resources :post do
  resources :comments#, only: [:new, :post] 
end
  #devise_for :users, controllers: { confirmations: 'confirmations' }
end
