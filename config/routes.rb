Rails.application.routes.draw do
  root to: 'homes#index'
  get "homes" => "homes#index"
  resources :users
  get "/users/login" => "users#show"
end
