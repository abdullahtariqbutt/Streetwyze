Rails.application.routes.draw do
  resources :assests
  devise_for :users
  root to: "users#index"
end
