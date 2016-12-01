Rails.application.routes.draw do
  resources :replies
  delete "users/:id/account", 	      to: "users#delete"
	devise_for :users, controllers: {
	  registrations: 'users/registrations',
	  sessions: 'users/sessions'
	}
	resources :posts
  
  get 'search', to: "users#search"

	get "users/:id",					 to: "users#show"
	post "users/:id/follow",	 to: "users#follow"
	post "users/:id/unfollow", to: "users#unfollow"
	get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
	get "hashtags",            to: "hashtags#index",     as: :hashtags
	post "posts/:id/like", 		 to: "posts#like_post",    as: :like
	get "posts/:id/reply",     to: "replies#new"
	post "posts/:id/reply",     to: "replies#create"
	delete "replies/:id",		   to: "replies#destroy"
  	get "users/:id/followers",           to: "followers#index",    as: :followers
  	get "users/:id/following",           to: "following#index",    as: :following
	
  root "posts#index"
end
