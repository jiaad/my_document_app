Rails.application.routes.draw do
  get 'admin/index'
  devise_for :users
  root to: "home#index"
  
  resources :users do
    member do 
        get :confirm_email
    end
  end

resources :admin

  #devise_for :users, controllers: { confirmations: 'confirmations' }
end
