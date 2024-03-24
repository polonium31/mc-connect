Rails.application.routes.draw do
  root 'pages#index'
  get 'signup', to: 'users#new' 
  resources :users, except: [:new]
  resources :comments
  resources :likes
  resources :posts do
    resources :post_comments
    resources :post_likes
  end
  #user login & logout
  get 'signin', to: 'sessions#new' 
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
end
