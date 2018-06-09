Rails.application.routes.draw do
  
  get 'sessions/new'
  
  devise_for :users
  get 'posts/index'
  post 'posts/write'
  post 'posts/reply_write'
  root 'posts#index'
  get 'posts/destroy'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'login' => 'sessions#destroy'
  
  resources :posts do
    resources :replies
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
