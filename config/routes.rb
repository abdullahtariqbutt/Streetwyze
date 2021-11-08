Rails.application.routes.draw do
  resources :map_assets do
    resources :stories, only: %i[new create]
  end
  resources :stories, only: %i[index show edit update destroy]

  devise_for :users
  root to: "users#index"
end
