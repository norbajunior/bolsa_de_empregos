BolsaDeEmpregos::Application.routes.draw do
  root 'dashboard#index'

  concern :accessable do
    get    'signup'  => 'users#new'
    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    get    'password/reset' => 'password_reset#edit'
    patch  'password/reset' => 'password_reset#update'
  end

  concerns :accessable

  get 'candidates/:id/dashboard' => 'candidates#dashboard', as: :dashboard_candidate
  get 'entities/:id/dashboard' => 'entities#dashboard', as: :dashboard_entity

  resources :candidates
  resources :entities
  resources :news
  resources :offers
  resources :interests, only: [:create, :destroy]
  resources :applications, only: [:create, :destroy]

  namespace :backoffice do
    root 'dashboard#index'

    concerns :accessable
  end
end
