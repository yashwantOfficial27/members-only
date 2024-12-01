Rails.application.routes.draw do
  get 'users/profile'
  # get 'posts/index'
  # get 'posts/new'
  # get 'posts/create'
  # get 'users/index'
  # get 'users/new'
  # get 'users/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"

  get "/u/:id", to: "users#profile", as: "user"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # #     
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments
  end
end
