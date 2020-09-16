Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"

  resources :users, only: [:index, :edit, :update]

  resources :items do 
    post :edit
    resources :orders, only: [:index, :create]
  end
  
end

