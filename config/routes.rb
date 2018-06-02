Rails.application.routes.draw do
  
  get 'posts/index'
  post 'posts/write'
  post 'posts/reply_write'
  root 'posts#index'
  get 'posts/destroy'
  
  resources :posts do
    resources :replies
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
