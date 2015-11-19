Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  #site root
  root 'business#index'
  get '/home', to: 'reviews#index'

  #Session
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'session#destroy'

  #Reviews
  resources :reviews, only: [:index, :create]

  #Categories
  resources :categories, only: [:show]

  #Businesses
  resources :businesses, only: [:index, :new, :create, :show]

  #Users
  get 'register', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'
  resources :users, only: [:create, :show]
end
