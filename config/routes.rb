Rails.application.routes.draw do

	devise_for :customers

	devise_for :admins, controllers: {
		sessions: "admins/sessions",
		passwords: "admins/passwords"
	}

	root to: "homes#top"
	get "homes/about", to:"homes#about"

	resources :sweets, only:[:index, :show]

	resource :customers, only:[:show]
	get "customers/editing", to:"customers#edit"
	patch "customers/update", to:"customers#update"
	get "customers/close_view", to: "customers#close_view"
	patch "customers/close", to: "customers#close"

	resources :deliveries, except:[:new, :show]

	resources :cart_items, only:[:index, :create, :update, :destroy]
	delete "cart_items_destroy_all", to: "cart_items#destroy_all"

	get "orders/thanks", to: "orders#thanks"
	resources :orders, only:[:new, :create, :index, :show]
	post "orders/confirm", to: "orders#confirm"


	namespace :admins do

		get "top", to: "customers#top"

		resources :customers, only:[:index, :show, :edit, :update]

		resources :orders, only:[:index, :show, :update]

		resources :order_sweets, only:[:update]

		resources :sweets, except:[:destroy]

		resources :genres, only:[:index, :create, :edit, :update]
	end


end
