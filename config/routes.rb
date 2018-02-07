Rails.application.routes.draw do

  root 'wocles#index'

  resources :users, only: [:create]
  get "signup" => "users#signup", :as => "signup"
  get "login" => "users#login", :as => "login"
  post "create_login_session" => "users#create_login_session"
  delete "logout" => "users#logout", :as => "logout"

end
