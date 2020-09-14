Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"

  resources :users, only: [:index, :edit, :update]

  resources :items, only: [:index, :new, :create, :show] do 
    post :edit
  end

  
end

