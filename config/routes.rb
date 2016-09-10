Rails.application.routes.draw do
  root "home#index"
  resources :tags
  resources :games do
    resources :reviews
  end
  resources :arcades
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
