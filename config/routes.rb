Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "/posts" => "posts#index"
  # get "/posts/:id" => "posts#show"
  # post "/posts" => "posts#create"
  # put "/posts/:id" => "posts#update"
  # delete "/posts/:id" => "posts#destroy"
  resources :posts do
    resources :comments
  end
end
