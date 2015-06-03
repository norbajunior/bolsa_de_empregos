BolsaDeEmpregos::Application.routes.draw do
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  namespace :candidates do
    resources :registrations

    get '/', to: 'registrations#index'
  end

  namespace :entities do
    resources :registrations

    get '/', to: 'registrations#index'
  end
end
