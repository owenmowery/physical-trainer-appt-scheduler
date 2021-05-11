Rails.application.routes.draw do
  root 'welcome#index'

  get '/client_signup', to: 'clients#signup'
  post '/client_signup', to: 'clients#create'
  get '/trainer_signup', to: 'trainers#signup'
  resources :appointments
  resources :clients
  resources :trainers
  
  
end
