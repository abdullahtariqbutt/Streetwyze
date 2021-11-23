Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"

  resources :users do
    resources :surveys, only: %i[new create ]
  end

  resources :surveys, only: %i[index show edit update destroy]

end
