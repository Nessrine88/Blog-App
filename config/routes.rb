Rails.application.routes.draw do
  devise_for :users
  # Other routes...

  get '/', to: 'users#index'
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:id/posts", to: "posts#index"
  get "/users/:id/posts/:post_id", to: "posts#show"
  get '/posts/new', to: 'posts#new'
 # config/routes.rb
resources :posts do
  resources :comments, only: [:new, :create]
  post 'likes', to: 'likes#create'
end

  
end
