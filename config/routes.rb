Rails.application.routes.draw do
  root 'welcome#index'

  get '/client_signup', to: 'clients#signup'
  post '/client_signup', to: 'clients#create'

  get '/client_login', to: 'clients#login'
  post '/client_login', to: 'sessions#client_login'

  get '/trainer_signup', to: 'trainers#signup'
  post '/trainer_signup', to: 'sessions#trainer_login'

  get '/trainer_login', to: 'trainers#login'
  post '/trainer_login', to: 'trainers#trainer_login'

  resources :appointments
  resources :clients
  resources :trainers
  

  
end
