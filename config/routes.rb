Rails.application.routes.draw do

  root 'users#index'
  resources :users
  resources :attractions
  #resources :rides
  post '/ride/:id' => 'rides#create', as: "ride"
  resources :sessions, except: [:new]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end