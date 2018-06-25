Rails.application.routes.draw do
  resources :seeker_profiles
  resources :recuitor_profiles

  devise_for :recuitors, path: 'recuitors',controllers: {registrations: 'recuitors/registrations'}

  devise_for :seekers, path: 'seekers',controllers: {registrations: 'seekers/registrations'}



  root 'jobs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
