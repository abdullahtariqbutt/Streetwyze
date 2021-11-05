Rails.application.routes.draw do

  resources :map_assets do
    resources :stories, only: [ :new, :create]
  end
  resources :stories, only: [:index, :show, :edit, :update, :destroy]

  devise_for :users
  root to: "users#index"

end
