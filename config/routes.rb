Rails.application.routes.draw do

	devise_for :users
	resources :posts
	get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
	get "hashtags",            to: "hashtags#index",     as: :hashtags

  get "newsfeeds",           to: "newsfeeds#index",    as: :newsfeeds
  get "followers",           to: "followers#index",    as: :followers
  get "users/:id",           to: "users#show",    as: :user
	
  root "posts#index"
end
