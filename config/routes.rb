Rails.application.routes.draw do
  root :to => 'users#index'

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :user_sessions
  resources :users
  resources :profiles
  resources :microposts
  resources :comments

end
