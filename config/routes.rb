Rails.application.routes.draw do
  root "photos#index"

  
  devise_for :users
  resources :comments
  resources :follow_requests
  resources :likes
  resources :photos

  get ":username/liked" => "photos#liked"
  get ":username/feed" =>
  get ":username/followers" => 
  get ":username/following" =>
  get ":username" => "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
