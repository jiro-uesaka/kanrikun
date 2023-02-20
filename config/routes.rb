Rails.application.routes.draw do
  devise_for :shops
  root to: 'homes#top'
  get 'homes/about', as: "about"
  get 'homes/menu', as: "menu"
  resources :items, only: [:edit, :index, :create, :update, :destroy]
  resources :shifts
  resources :workers
  resources :patterns
  resources :sales, only: [:new, :edit, :index, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
