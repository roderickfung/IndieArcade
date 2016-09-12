Rails.application.routes.draw do
    root 'home#index'
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
    get 'admin' => 'admins#show'

    root 'home#index'
    get '/home/faq' => 'home#faq'

    # approved and reject buttons for admin game detail page
    patch '/approve_game/:id' => 'games#approved', as: :status_approved
    patch '/reject_game/:id' => 'games#rejected', as: :status_rejected
end
