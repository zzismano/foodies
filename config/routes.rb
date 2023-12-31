Rails.application.routes.draw do
  get 'profile/:id', to: 'profile#show', as: 'profile'
  get 'profile/:id/list', to: 'profile#list', as: "list"

  post 'profile/:id/follow', to: "profile#follow", as: "follow"
  post 'profile/:id/unfollow', to: "profile#unfollow", as: "unfollow"
  post 'profile/:id/accept', to: "profile#accept", as: "accept"
  post 'profile/:id/decline', to: "profile#decline", as: "decline"
  post 'profile/:id/cancel', to: "profile#cancel", as: "cancel"
  get 'users/search', to: "users#search", as: "search"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :user
  root to: "pages#home"
  # root "articles#index"

  resources :users, only: %i[show] do
    resources :meals
    resources :recipes
  end

  resources :friendships, only: %i[create]

  resources :friendships
  resources :comments


  get "create", to: "users#create_post", as: "create_post"

end
