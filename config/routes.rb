Rails.application.routes.draw do

	devise_for :users
	resources :posts
	get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
	get "hashtags",            to: "hashtags#index",     as: :hashtags

	root "posts#index"
end
