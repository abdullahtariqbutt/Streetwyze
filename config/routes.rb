Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"

  resources :users do
    resources :surveys, only: %i[new create]
  end

  resources :surveys, only: %i[index show edit update destroy] do
    resources :responses, only: %i[new create]
  end

  resources :responses, only: %i[index]
  get "show_survey_fill", to: "responses#show_msg"
end
