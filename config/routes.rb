Rails.application.routes.draw do

	devise_for :users
	resources :posts
	get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
	get "hashtags",            to: "hashtags#index",     as: :hashtags

	post "posts/:id/like", to: "posts#like_post", as: :like

	root "posts#index"
end
