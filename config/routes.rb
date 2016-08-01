Rails.application.routes.draw do
  devise_for :users
  root 'homes#show'
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create]
  resources :relationships, only: [:create, :destroy]

  #No route matches [DELETE] "/relationships" fuck you haha
  delete  "relationships" => "relationships#destroy"
end
