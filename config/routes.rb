BolsaDeEmpregos::Application.routes.draw do
  namespace :entity do
    resources :registrations
  end
end
