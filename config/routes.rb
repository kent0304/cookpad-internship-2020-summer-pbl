Rails.application.routes.draw do
  resources :posts
  resources :users
  resources :images, only: %w[show]
end
