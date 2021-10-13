Rails.application.routes.draw do
  get 'sessions/new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'
  resources :users
  root to: 'pages#home'
  resources :users
  get "/users/login" => "users#show"
end
