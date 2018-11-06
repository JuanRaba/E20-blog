Rails.application.routes.draw do

  get 'pages/dashboard'
  get 'users/destroy/:id', to: "pages#destroy", as: "userdestroy"
  get 'users/addtoadmin/:id', to: "pages#addtoadmin", as: "addtoadmin"
  get 'users/removeadmin/:id', to: "pages#removeadmin", as: "removeadmin"

	resources :posts do
		resources :comments, only: [:create, :destroy]
	end

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'
	}

	root 'posts#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
