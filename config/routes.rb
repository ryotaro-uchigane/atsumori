Rails.application.routes.draw do
  resources :entrysheets
  resources :users
  resources :events

  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"
end
