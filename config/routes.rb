Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#home'

  resources :equipment do
    resources :reservations
  end
  
  resources :reservations, except: [:create]
  resources :users
  resources :sessions, except: [:new, :create]

  post '/create_reservation' => 'reservations#create'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#oauth_create'
end
