Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'api/v1/posts#index'

  post '/api/v1/login', to: 'api/v1/users/session#create'
  post '/api/v1/sign_up', to: 'api/v1/users/registration#create'

  namespace :api do
    namespace :v1 do
      resources :posts
    end
  end
end
