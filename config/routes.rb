Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  #site root
  root 'reviews#index'
  get '/home', to: 'revies#index'

  #Session
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'session#destroy'

  #Reviews
  resources :reviews, only: [:index, :create]

  #Businesses
  resources :businesses, only: [:index, :new, :create, :show]

  #Users
  get '/register', to: 'users#new'
  resources :users, only: [:create, :show]
end
