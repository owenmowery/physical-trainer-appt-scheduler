Rails.application.routes.draw do
  root 'welcome#index'

  get '/client_signup', to: 'clients#signup'
  get '/trainer_signup', to: 'trainers#signup'
  resources :appointments
  resources :clients
  resources :trainers
  
  
end
