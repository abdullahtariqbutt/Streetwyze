Rails.application.routes.draw do
  devise_for :users
  root to: "map_assets#index"

  resources :map_assets  
end
