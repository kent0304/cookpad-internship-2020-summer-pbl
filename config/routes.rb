Rails.application.routes.draw do
  resources :posts do 
    resources :oishisos, only: [:create, :destroy]
    resources :tellmes, only: [:create, :destroy]
  end 
  resources :users
  resources :images, only: %w[show]

  root 'posts#index'
end
