Rails.application.routes.draw do
  resources :tags
  resources :games do
    resources :reviews
  end
  resources :arcades
  resources :users
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy' #routes for creating and destroying session

  get '/signup' => 'users#new' # simple route for new user signup
  post '/users' => 'users#create'

end
