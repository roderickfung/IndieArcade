Rails.application.routes.draw do
  root "home#index"
  resources :tags
  resources :games do
    resources :reviews
  end
  resources :arcades
  resources :users
  resources :sessions

  resources :password_resets

  post '/login' => 'sessions#create'
  post '/users' => 'users#create' # from commit without remember me and forgotten pass

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy', :as => 'logout'

  get 'signup' => 'users#new', :as => 'signup'

  root 'home#index'
end
