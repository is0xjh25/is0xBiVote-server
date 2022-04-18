Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
			get '/test', to: 'users#test'

			post '/login', to: 'auth#create'
		
			post '/users', to: 'users#create'
			get '/profile', to: 'users#info'
			patch '/profile', to: 'users#update'
			
			get '/vote-entries', to: 'votes#entry'
			get '/vote/:id', to: 'votes#info'
			get '/search-date/:date', to: 'votes#search_by_date'
			get '/search-keyword/:keyword', to: 'votes#search_by_keyword'

			get '/user-vote/:id', to: 'vote_records#info'
			patch '/user-vote/:id', to: 'vote_records#update'

			get '/post/:id', to: 'posts#info'
			post '/post/:id', to: 'posts#create'
			delete '/post/:id', to: 'posts#destroy'

			post '/upvote/:id', to: 'upvotes#create'
			delete '/upvote/:id', to: 'upvotes#destroy'
		end
	end
end