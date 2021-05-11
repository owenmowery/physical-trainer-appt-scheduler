Rails.application.routes.draw do
  root 'welcome#index'

  get '/client_signup', to: 'clients#signup'
  get '/client_login', to: 'clients#login'

  post '/client_signup', to: 'sessions#create'
  post '/client_login', to: 'sessions#login'

  get '/trainer_signup', to: 'trainers#signup'
  get '/trainer_login', to: 'trainers#login'
  resources :appointments
  resources :clients
  resources :trainers
  
  
end
