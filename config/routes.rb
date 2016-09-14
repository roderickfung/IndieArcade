Rails.application.routes.draw do

  get '/contact_us' => 'contacts#index', as: :contact

  resources :tags
  resources :games do
    resources :reviews
    resources :keys, only: [:new, :create]
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
  get 'home' => 'home#index'
  get '/home/faq' => 'home#faq'
  root 'home#index'


  # approved and reject buttons for admin game detail pa
  patch '/approve_game/:id' => 'games#approved', as: :status_approved
  patch '/reject_game/:id' => 'games#rejected', as: :status_rejected

  # approved and reject buttons for admin panel user approval
  patch '/approve_user/:id' => 'users#approved', as: :user_approved
  patch '/reject_user/:id' => 'users#rejected', as: :user_rejected

  # liability-load
  resources :liability, only: [:index]

end
