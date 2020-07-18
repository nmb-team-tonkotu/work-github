Rails.application.routes.draw do
	devise_for :customers

	devise_for :admins, controllers: {
		sessions: "admins/sessions",
		passwords: "admins/passwords"
	}

	root to: "homes#top"
	get "homes#about", to:"homes#about"

	resources :sweets, only:[:index, :show]

	resource :customers, only:[:show, :edit, :udate]
	get "customers/close_view", to: "customers#close_view"
	patch "customers/close", to: "customers#close"

	resources :deliveries, except:[:new, :show]

	resources :cart_items, only:[:index, :create, :update, :destory]
	delete "cart_items", to: "cart_items#destroy_all"

	resources :orders, only:[:index, :show,  :new, :create]
	get "orders/confirm", to: "orders#confirm"
	get "orders/thanks", to: "orders#thanks"

	namespace :admins do

		get "admins/top", to: "customers#top"

		resources :customers, only:[:index, :show, :edit, :update]

		resources :orders, only:[:index, :show, :update]

		resource :order_sweets, only:[:update]

		resources :sweets, except:[:destroy]

		resources :genres, only:[:index, :create, :edit, :update]
	end


end
