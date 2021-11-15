Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"

  post "checkout/create", to:'checkout#create'
  resources :webhooks, only: [:create]
end
