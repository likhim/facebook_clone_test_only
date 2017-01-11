Rails.application.routes.draw do

	root 'welcome#index'

	resources :users

	resources :statuses

	resources :sessions

	get "logout" => "sessions#destroy", :as => "signout"
	get "login" => "session#new", :as => "login"
end
