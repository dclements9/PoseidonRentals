Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#home'

  resources :equipment do
    resources :reservations
  end
  
  resources :reservations
  resources :users
  resources :sessions, except: [:new, :create]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # Omniauth route
  # post '/auth/:provider/callback', to: 'sessions#oauth_create'
  get '/auth/:provider/callback', to: 'sessions#oauth_create'
  
  # Test Google Oauth Route
  get '/auth/google_oauth2/callback', to: 'sessions#google_oauth_create'
end
