Rails.application.routes.draw do
  resources :entrysheets
  resources :users
  resources :events
  resources :followings, only: [:create, :destroy]

  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"

  get 'chats/show'
end
