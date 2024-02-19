Rails.application.routes.draw do
  post 'requests/:id/comprar', to: 'requests#comprar', as: 'comprar_request'
  get 'requests/:id/comprar', to: 'requests#comprar', as: 'comprar_request_get'
  get 'requests/create'
  
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
                    path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  devise_scope :user do
    get '/logout', to: 'users/sessions#destroy'
  end
  get 'render/index'
  root 'render#index'
  resources :rooms do
    resources :room_messages
  end
  resources :compras, only: [:new, :create, :show, :update, :destroy, :index]
  resources :products do
    resources :reviews, only: [:new, :create, :destroy]
    resources :requests, only: [:create]
  end
  resources :requests, only: [:index, :show, :destroy]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end