Rails.application.routes.draw do
  # get 'posts/index'
  # get 'posts/new'
  # get 'posts/create'
  # get 'users/index'
  # get 'users/new'
  # get 'users/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  devise_for :users
  # #     
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
