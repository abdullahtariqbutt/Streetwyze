Rails.application.routes.draw do
  resources :map_assets

  devise_for :users
  root to: "map_assets#index"
end
