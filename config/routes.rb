Rails.application.routes.draw do
  resources :replies
	devise_for :users, controllers: {
	  registrations: 'users/registrations'
	}
	resources :posts
  
  
  get 'search', to: "users#search"
  get 'search', to: "hashtags#search"

	get "users/:id",					 to: "users#show"
	post "users/:id/follow",	 to: "users#follow"
	post "users/:id/unfollow", to: "users#unfollow"
	get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
	get "hashtags",            to: "hashtags#index",     as: :hashtags
	post "posts/:id/like", 		 to: "posts#like_post",    as: :like
	get "posts/:id/reply",     to: "replies#new"
	post "posts/:id/reply",     to: "replies#create"

  get "newsfeeds",           to: "newsfeeds#index",    as: :newsfeeds
  get "followers",           to: "followers#index",    as: :followers
  get "following",           to: "following#index",    as: :following
	
  root "posts#index"
end
