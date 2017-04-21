Rails.application.routes.draw do

	scope module: :v1 do

		# DEVISE
  	mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], controllers: { registrations: "registrations", sessions: "v1/sessions" }
		
	  # CUSTOM ROUTES
	  # Relationship
    get 'relationships/list-followers', to: 'relationships#list_followers'
    post 'relationships/accept', 				to: 'relationships#accept'
    post 'relationships/reject', 				to: 'relationships#reject'

		# Post
    get '/board', to: 'posts#board'
    
    # RESOURCES
	  resources :posts
	  resources :relationships

	end
	
end
