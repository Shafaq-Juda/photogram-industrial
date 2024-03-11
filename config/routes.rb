Rails.application.routes.draw do
  root "photos#index"

 # get "/users/:id" => "users#show", as: :user

  devise_for :users
 
  resources :comments
  resources :follow_requests
  resources :likes
  resources :photos
 
  #making a route get, => means liked method i.e def liked...end in users controller.
  get ":username/liked" => "users#liked", as: :liked
  # get ":username/feed"
  
  #making a route get, => means followers method i.e def followers...end in users controller.
  get ":username/followers" => "users#followers", as: :followers

  #making a route get, => means following method i.e def following...end in users controller.
  get ":username/following" => "users#following", as: :following

  #making a route get, => means show method i.e def show...end in users controller.
  get ":username" => "users#show", as: :user
end
