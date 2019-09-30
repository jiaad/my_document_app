Rails.application.routes.draw do
  get 'profile/show'
  get 'admin/index'
  devise_for :users
  root to: "home#index"
  
  resources :users do
    member do 
        get :confirm_email
    end
  end

resources :admin
resources :profile

  #devise_for :users, controllers: { confirmations: 'confirmations' }
end
