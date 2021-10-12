Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users
  get "/users/login" => "users#show"
end
