BolsaDeEmpregos::Application.routes.draw do
  namespace :candidate do
    resources :registrations
  end

  namespace :entity do
    resources :registrations
  end
end
