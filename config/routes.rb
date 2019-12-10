Rails.application.routes.draw do
  devise_for :users

  get "/signup",  to: "users#new"
  post "/signup", to: "users#create"

  get "/signin",  to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  namespace :admin do
    resources :users
    resources :categories
  end
end
