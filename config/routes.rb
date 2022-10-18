Rails.application.routes.draw do
  root 'home#index' 
  get '/courses/load', to: 'courses#load'
  get 'signup', to: 'users#new'
  #resource :users, only: [:new, :create]
  resource :users
end
