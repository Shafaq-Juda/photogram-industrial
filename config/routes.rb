Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"
  root "photos#index"

  devise_for :users
 
  resources :comments
  resources :follow_requests
  resources :likes
  resources :photos

end
