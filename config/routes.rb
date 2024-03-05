Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "photos#index"

  # devise_for :users
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :comments
  resources :follow_requests
  resources :likes
  resources :photos

end
