Rails.application.routes.draw do
  devise_for :users

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
end
