Rails.application.routes.draw do
  resources :markers
  root to: 'homes#index'
  get "homes" => "homes#index"
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'
  resources :users
  get "/users/login" => "users#show"
end
