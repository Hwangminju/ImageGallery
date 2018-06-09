Rails.application.routes.draw do
  
  get 'sessions/new'
  
  devise_for :users
  root 'posts#index'
  get 'posts/index'
  post 'posts/write'
  get 'posts/edit'
  get 'posts/destroy'
  
  post 'replies/write'
  get 'replies/edit'
  get 'replies/destroy'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'login' => 'sessions#destroy'
  
  resources :posts do
    resources :replies
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
