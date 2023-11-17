Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/', to: 'users#index'
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:id/posts", to: "posts#index"
  get "/users/:id/posts/:post_id", to: "posts#show"
  get '/posts/new', to: 'posts#new'
  post '/users/:id/posts', to: 'posts#create'
  post '/posts/:id/like', to: 'posts#like'
  post '/posts/:id/comment', to: 'posts#comment'
end