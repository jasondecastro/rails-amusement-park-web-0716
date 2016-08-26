Rails.application.routes.draw do
  
  resources :attractions
  # resources :sessions

  get 'users/new', to: 'registration#new', as: 'register'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/', to: 'application#index', as: 'root'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy'

  post '/users/new', to: 'registration#create'

end