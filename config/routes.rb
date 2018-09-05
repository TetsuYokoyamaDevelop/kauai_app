Rails.application.routes.draw do
  root :to => 'user_sessions#new'

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :user_sessions
  resources :users
  resources :microposts do
      collection do
      get 'post_history'
    end
      resources :comments
  end
end
