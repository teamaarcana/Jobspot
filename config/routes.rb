Rails.application.routes.draw do


  resources :seeker_profiles
  resources :recuitor_profiles
  resources :job_posts
  resources :apply_jobs, only: [:create]
  get 'posted_jobs', to: 'recuitor_profiles#posted_jobs', as: :posted_jobs

  devise_for :recuitors, path: 'recuitors',controllers: {registrations: 'recuitors/registrations'}

  devise_for :seekers, path: 'seekers',controllers: {registrations: 'seekers/registrations'}

  mount Ckeditor::Engine => '/ckeditor'

  root 'search_jobs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
