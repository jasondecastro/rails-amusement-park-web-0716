Rails.application.routes.draw do
  resources :users
  resources :rides
  resources :attractions

  get '/', to: 'application#index', as: 'root'
  get '/signin', to: 'users#signin'
  post '/auth', to: 'users#auth'
  get '/signout', to: 'users#signout'

end