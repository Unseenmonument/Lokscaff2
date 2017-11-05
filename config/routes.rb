Rails.application.routes.draw do

  root 'rumes#index'

  resources :user do
    resources :comments
    resources :rumes
    resources :convos
    resources :stores do
      resources :products
    end
    post 'stores/makestore' => 'stores#makestore', as: 'makestore'
  end
  
  get 'user/:id/show' => 'user#show'
  get 'user/:id/listen' => 'user#follow', as: 'follow'
  get 'user/:id/ignore' => 'user#unfollow', as: 'unfollow'

  # resources :comments
  
  resources :comments do
    resources :comments
  end
  
  get 'rumes/:rume_id/convos/:convo_id/comments/:id/upvotes' => 'comments#upvote', as: 'upvotecom'
  get 'rumes/:rume_id/convos/:convo_id/comments/:id/downvotes' => 'comments#downvote', as: 'downvotecom'



  resources :rumes do
    member { post :vote }
  	resources :convos do
  	  member { post :vote }
  		resources :comments
  		  member { post :vote }
  	end
  end

  get 'rumes/:rume_id/convos/:id/upvotes' => 'convos#upvote', as: 'upvote'
  get 'rumes/:rume_id/convos/:id/downvotes' => 'convos#downvote', as: 'downvote'
  
  resources :convos

  get 'rumes/:id/listen' => 'rumes#listen', as: 'listen'
  get 'rumes/:id/ignore' => 'rumes#ignore', as: 'ignore'

  resources :votes

  resources :tottles, :rooms
	
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
