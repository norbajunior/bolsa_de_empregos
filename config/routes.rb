BolsaDeEmpregos::Application.routes.draw do
  namespace :candidates do
    resources :registrations

    get '/', to: 'registrations#index'
  end

  namespace :entities do
    resources :registrations

    get '/', to: 'registrations#index'
  end
end
