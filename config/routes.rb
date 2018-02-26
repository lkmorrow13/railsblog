Rails.application.routes.draw do
	get '/login', to: 'sessions#new', as: 'login_view'
	post '/login', to: 'sessions#create', as: 'login'
	delete '/logout', to: 'sessions#destroy', as: 'logout'

	resources :posts
	resources :users
	root 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
