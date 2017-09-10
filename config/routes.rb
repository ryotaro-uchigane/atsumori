Rails.application.routes.draw do
  resources :users

  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events
  resources :followings, only: [:create, :destroy]
end
