Rails.application.routes.draw do
  get 'signup', to: 'users#new' 
  resources :users, except: [:new]
  resources :comments
  resources :likes
  resources :posts do
    resources :post_comments
    resources :post_likes
  end
  # root 'users#index'
end
