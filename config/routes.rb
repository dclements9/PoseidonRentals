Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#home'

  resources :equipment
  resources :reservations
  resources :users
  
  get '/login' => 'sessions#new'
end
