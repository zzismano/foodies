Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # root "articles#index"

  resources :users, only: %i[show] do
    resources :meals
    resources :recipe
  end
  resources :friendships
  resources :comments

  get "create", to: "users#create_post", as: "create_post"
end
