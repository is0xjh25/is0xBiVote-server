Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      post '/users', to: 'users#create'
      get '/username_exist/:username', to: 'users#find_username'
      get '/email_exist/:email', to: 'users#find_email', :constraints => { :email => /[^\/]+/ }
      get '/profile', to: 'users#profile'
      patch '/profile', to: 'users#update'
    end
  end
end
