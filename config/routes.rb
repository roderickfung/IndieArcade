Rails.application.routes.draw do

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

  get 'login' => 'sessions#new', :as => 'login-popup'
  get 'logout' => 'sessions#destroy', :as => 'logout'

  get 'signup' => 'users#new', :as => 'signup'
  get 'admin' => 'admins#show'
  root 'home#new'

  get 'home' => 'home#index'
  get '/home/faq' => 'home#faq'

  # approved button for admin game detail page
  post '/game/status_approve/:id' => 'game#status_approve', as: :status_approve
  # reject button for admin detail page
  post '/game/status_reject/:id' => 'game#status_reject', as: :status_reject
end
