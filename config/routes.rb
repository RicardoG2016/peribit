Rails.application.routes.draw do
	devise_for :users
	resources :posts
	get "users/:id",					 to: "users#show"
	get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
	get "hashtags",            to: "hashtags#index",     as: :hashtags
	root "posts#index"
end
