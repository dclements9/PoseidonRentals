Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#home'

  resources :equipment
  resources :reservations
  resources :users
  resources :sessions, except: [:new, :create]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#create'
end
