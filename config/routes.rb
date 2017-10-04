Rails.application.routes.draw do

  
	root 'rumes#index'
  resources :rumes
	
  devise_for :users
  resources :rooms
	get '/rooms/1/convo' => 'rooms#convo' 
	get '/rooms/1/convo/new' => 'rooms#newconvo'
	get '/rooms/1/convo/1/edit' => 'rooms#editconvo'
	




  resources :tottles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
