Rails.application.routes.draw do
  get 'comment/index'
  get 'comment/show'
  get 'comment/new'
  get 'comment/edit'
  get 'comment/create'
  get 'comment/update'
  get 'comment/destroy'
  root :to => 'users#index'

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :user_sessions
  resources :users
  resources :profiles
  resources :microposts

end
