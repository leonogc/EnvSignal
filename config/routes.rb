Rails.application.routes.draw do
  resources :markers
  get '/markers/:id/up' => "markers#upvote"
  get '/markers/:id/down' => "markers#downvote"
  get '/markers/:id/verify' => "markers#verify"

  root to: 'homes#index'
  get "homes" => "homes#index"
  get "index/user" => "homes#user"

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'
  
  get '/users/profile' => 'users#show'
  get '/users/edit' => 'users#edit'
  patch '/users/edit' => 'users#update'  
  resources :users

  get "authorities/login" => 'authorities#login'
  post "authorities/login" => 'authorities#check_login'
  get "authorities" => 'authorities#index'
  delete '/authorities/sign_out' => 'authorities#destroy'

  get "admin/login" => 'admins#new'
  post "admin/login" => 'admins#create'
  get "admin" => 'admins#index'
  delete '/admin/sign_out' => 'admins#destroy'
  get "admin/create_authority" => 'authorities#new'
  post "admin/create_authority" => 'authorities#create'
  get "admin/list_authorities" => 'authorities#list'
end
