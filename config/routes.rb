BolsaDeEmpregos::Application.routes.draw do
  root 'dashboard#index'

  concern :accessable do
    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
  end

  concerns :accessable

  get    'signup'         => 'users#new'
  get    'password/reset' => 'password_reset#edit'
  patch  'password/reset' => 'password_reset#update'

  get    'password/forgot' => 'forgot_password#new', as: :new_forgot_password
  post   'password/forgot' => 'forgot_password#create', as: :create_forgot_password
  get    'password/forgot/:token' => 'forgot_password#edit', as: :edit_forgot_password
  patch   'password/forgot/' => 'forgot_password#update', as: :update_forgot_password

  get 'candidates/:id/dashboard' => 'candidates#dashboard', as: :dashboard_candidate
  get 'entities/:id/dashboard' => 'entities#dashboard', as: :dashboard_entity

  get 'featured' => 'featured#index'
  
  resources :candidates
  resources :entities
  resources :news, only: [:index, :show]
  resources :offers
  resources :interests, only: [:create, :destroy]
  resources :applications, only: [:create, :destroy]

  namespace :backoffice do
    root 'dashboard#index'

    concerns :accessable

    resources :users
    resources :news

    get   'users/:id/change_password' => 'users#edit_password', as: :edit_password
    patch 'users/:id/change_password' => 'users#update_password', as: :update_password
  end
end
