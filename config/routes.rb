Rails.application.routes.draw do
  resources :viewprofiles
  resources :animalprofiles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'animalprofile/add'
  get 'home/index'	
end
