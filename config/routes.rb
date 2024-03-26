Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'pages#homepage'
  get 'signup', to: 'users#new' 
  resources :users, except: [:new]
  resources :posts do
    resources :comment_posts
  end

  #user login & logout
  get 'signin', to: 'sessions#new' 
  post 'signin', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy'
end
