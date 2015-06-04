BolsaDeEmpregos::Application.routes.draw do
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'candidates/:id/dashboard' => 'candidates#dashboard', as: :dashboard_candidate

  resources :candidates
  resources :entities
end
