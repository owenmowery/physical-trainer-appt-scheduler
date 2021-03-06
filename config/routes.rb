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

  patch '/clients/:client_id/appointments', to: 'appointments#create'

  #resources :clients

  delete '/logout', to: 'sessions#destroy'

  #omniauth 
  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get, :post]

  resources :trainers do
    #resources :appointments
  end
  resources :clients do
      resources :appointments
  end
 
  

  
end
