Rails.application.routes.draw do
  resources :markers
  root to: 'homes#index'
  get "homes" => "homes#index"
  resources :users
  get "/users/login" => "users#show"
end
