Rails.application.routes.draw do

  devise_for :users
  root to: "map_assets#index"

  # Survey and Responses
  resources :users do
    resources :surveys, only: %i[new create]
  end

  resources :surveys, only: %i[index show edit update destroy] do
    resources :responses, only: %i[new create]
  end

  resources :responses, only: %i[index]
  get "show_survey_fill", to: "responses#show_msg"

  # Map_Assets and Stories
  get 'search_assets', to: "map_assets#index"
  get 'search_stories', to: "stories#index"

  resources :map_assets do
    member do
      delete :delete_image
    end
    resources :stories, only: %i[new create]
  end

  resources :stories, only: %i[index show edit update destroy] do
    member do
      delete :delete_image
    end
  end

  # Payment
  post "checkout/create", to:'checkout#create'
  resources :webhooks, only: [:create]

end
