Rails.application.routes.draw do
  resources :vote_records
  resources :upvotes
  resources :posts
  resources :votes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
