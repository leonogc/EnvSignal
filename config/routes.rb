Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'
  resources :users
  root to: 'pages#home'
  get "/users/login" => "users#show"
  get "authorities/login" => 'authorities#new'
  post "authorities/login" => 'authorities#create'
  get "authorities" => 'authorities#index'
  delete '/authorities/sign_out' => 'authorities#destroy'
end
