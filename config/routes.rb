Rails.application.routes.draw do
  root "photos#index"

 # get "/users/:id" => "users#show", as: :user

  devise_for :users
 
  resources :comments
  resources :follow_requests
  resources :likes
  resources :photos
 
  get ":username/liked" => "users#liked", as: :liked
  # routes to be created and make them worked:
  # get ":username/feed"
  # get ":username/followers"
  # get ":username/following"

  get ":username" => "users#show", as: :user
end
