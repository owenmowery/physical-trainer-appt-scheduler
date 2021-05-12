Rails.application.routes.draw do
  root 'welcome#index'

  get '/client_signup', to: 'clients#signup'
  post '/client_signup', to: 'clients#create'

  get '/client_login', to: 'clients#login'
  post '/client_login', to: 'sessions#client_login'

  get '/trainer_signup', to: 'trainers#signup'
  post '/trainer_signup', to: 'trainers#create'

  get '/trainer_login', to: 'trainers#login'
  post '/trainer_login', to: 'sessions#trainer_login'

  get '/clients/:id', to: 'clients#show'

  resources :appointments
  resources :clients
  resources :trainers
  

  
end
