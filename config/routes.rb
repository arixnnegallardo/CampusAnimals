Rails.application.routes.draw do
  resources :adoption_requests
  resources :donations
  resources :accounts
  resources :uploads
  resources :homes
  resources :users
  resources :viewprofiles
  resources :animalprofiles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#index'
  get 'animalprofile/add'
  get '/resolve_request/c/:id', to: 'adoption_requests#resolve'
  get 'home/index'	
  get '/logout', to: 'logout#index'  
  get '/homepage', to: 'homes#index'  
  get '/login', to: 'accounts#new'
  get '/generate_token', to: 'token#index'
  get '/end_session', to: 'token#destroy'
  get '/adminsettings', to: 'accounts#admin'
  get '/adminsettings_password', to: 'accounts#passwordchange'
  get '/adminsettings_username', to: 'accounts#adminchange'
  get '/donate', to: 'donations#donate'
  get '/verify_donation', to: 'donations#new'
  get '/adopt', to: 'adoption_requests#new'
  get '/summary_report', to: 'summaries#index'
  get '/summaries', to: 'summaries#index'
end

