Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    get 'sale_items/search', to: 'sale_items#search'
    resources :comments only: [:show, :index, :create, :destroy]
    resources :followers only: [:show, :index, :create, :destroy]
    resources :media only: [:show, :index, :create, :destroy, :update]
    resources :likes only: [:show, :index, :create, :destroy]
    resources :pictures only: [:show, :index, :create, :destroy]
    resources :users, only: [:show, :index]
  end
end
