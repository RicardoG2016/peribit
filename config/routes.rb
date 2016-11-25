Rails.application.routes.draw do
	devise_for :users
	resources :posts
	get "users/:id",					 to: "users#show"
	post "users/:id/follow",	 to: "users#follow"
	post "users/:id/unfollow", to: "users#unfollow"
	get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
	get "hashtags",            to: "hashtags#index",     as: :hashtags
	root "posts#index"
end
