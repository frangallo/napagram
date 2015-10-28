Rails.application.routes.draw do
  root 'static_pages#root'
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    get 'media/feed', to: 'media#feed'
    resources :comments, only: [:show, :index, :create, :destroy]
    resources :followers, only: [:show, :index, :create, :destroy]
    resources :media, only: [:show, :create, :destroy, :update]
    resources :likes, only: [:show, :index, :create, :destroy]
    resources :pictures, only: [:show, :index, :create, :destroy]
    resources :users, only: [:show, :index]
  end
end
