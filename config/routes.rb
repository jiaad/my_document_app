Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"
  

resources :admin
resources :profile do 
	match '/follow' , to: "followers#follow", via: 'post' 
	match '/unfollow' , to: "followers#unfollow", via: 'delete' 

end
resources :followers, only: [:new, :create, :delete]
resources :post do
  resources :images do
    match '/image_destroy' , to: "post#image_destroy" ,via: 'delete'
  end
  resources :comments#, only: [:new, :post] 
end

get 'static/news',      to: 'static#news'
get 'static/about',     to: 'static#about'
get 'static/contact',   to: 'static#contact'
get 'static/not_found',   to: 'static#not_found'
get '/timeline', to:'timeline#index'
  #devise_for :users, controllers: { confirmations: 'confirmations' }
end
