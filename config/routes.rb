Rails.application.routes.draw do
  devise_for :shops
  root to: 'homes#top'
  get 'homes/about', as: "about"
  get 'homes/menu', as: "menu"
  get 'items/search', as: "items_search"
  resources :items, only: [:index, :create, :update, :destroy] do
    resources :orders, only: [:show, :create, :update, :destroy]
  end
  get "orders/index", as: "orders"
  get 'shifts/preview', as: "preview"
  delete "shifts/destroy_all", as: "destroy_all"
  resources :shifts, only: [:edit, :index, :create, :update, :destroy]
  resources :workers, only: [:index, :create, :update, :destroy]
  resources :patterns, only: [:index, :create, :update, :destroy]
  resources :sales, only: [:show, :edit, :index, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
