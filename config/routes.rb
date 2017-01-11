Rails.application.routes.draw do

	root 'welcome#index'

	resources :users

	resources :statuses

	resources :sessions

	# get "logout" => "sessions#destroy", :as => "signout"
	delete "/sessions" => "sessions#destroy", :as => "logout"
	get "/sessions" => "session#new", :as => "login"
end
