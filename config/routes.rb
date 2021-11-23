Rails.application.routes.draw do

  devise_for :users
  root to: "map_assets#index"

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

end
