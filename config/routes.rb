Rails.application.routes.draw do
  get '/markers/self' => "markers#self"
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
  get "setLocation" => 'sessions#setLocation'
  
  get '/users/profile' => 'users#show'
  get '/users/edit' => 'users#edit'
  patch '/users/edit' => 'users#update'  
  delete '/users' => 'users#delete'
  resources :users

  get "/authorities/login" => 'authorities#login'
  post "/authorities/login" => 'authorities#check_login'
  get "/authorities/profile" => 'authorities#show'
  get "/authorities/edit" => 'authorities#edit'
  patch "/authorities/edit" => 'authorities#update'
  delete '/authorities/sign_out' => 'authorities#destroy'

  get "admin/login" => 'admins#new'
  post "admin/login" => 'admins#create'
  get "admin" => 'admins#index'
  delete '/admin/sign_out' => 'admins#destroy'
  get "admin/create_authority" => 'authorities#new'
  post "admin/create_authority" => 'authorities#create'
  get "admin/list_authorities" => 'authorities#list'
  get "admin/list_users" => 'admins#list_users'
  get "admin/edit_user" => 'admins#edit_user'
  patch "admin/edit_user" => 'admins#update_user'
end
