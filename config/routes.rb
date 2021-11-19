Rails.application.routes.draw do
  resources :markers
  get '/markers/:id/up' => "markers#upvote"
  get '/markers/:id/down' => "markers#downvote"
  get '/markers/:id/verify' => "markers#verify"

  root to: 'homes#index'
  get "homes" => "homes#index"
  get "user" => "homes#user"
  get "authority" => "homes#authority"
  get "login" => "homes#login"

  get    '/users/login'   => 'sessions#new'
  post   '/users/login'   => 'sessions#create'
  delete '/users/sign_out'  => 'sessions#destroy'
  
  get '/users/profile' => 'users#show'
  get '/users/edit' => 'users#edit'
  patch '/users/edit' => 'users#update'  
  resources :users

  get "/authorities/login" => 'authorities#login'
  post "/authorities/login" => 'authorities#check_login'
  delete '/authorities/sign_out' => 'authorities#destroy'

  get "admin/login" => 'admins#new'
  post "admin/login" => 'admins#create'
  get "admin" => 'admins#index'
  delete '/admin/sign_out' => 'admins#destroy'
  get "admin/create_authority" => 'authorities#new'
  post "admin/create_authority" => 'authorities#create'
  get "admin/list_authorities" => 'authorities#list'
end
