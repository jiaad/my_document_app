Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"
  

resources :admin
resources :profile

resources :post do
  resources :images do
    match '/image_destroy' , to: "post#image_destroy" ,via: 'delete'
  end
  resources :comments#, only: [:new, :post] 
end

get 'static/news',      to: 'static#news'
get 'static/about',     to: 'static#about'
get 'static/contact',   to: 'static#contact'
  #devise_for :users, controllers: { confirmations: 'confirmations' }
end
