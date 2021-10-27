Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'
  resources :users
  root to: 'pages#home'
  get 'profile' => 'users#show'
  get 'edit' => 'users#edit'
  patch 'edit' => 'users#update'
end
