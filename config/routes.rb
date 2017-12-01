Rails.application.routes.draw do

  root 'rumes#index'

  resources :user do
    resources :comments
    resources :rumes
    resources :convos
    resources :stores do
      resources :comments
      resources :products do
        resources :comments
      end
    end
    post 'stores/makestore' => 'stores#makestore', as: 'makestore'
  end
  
  get 'user/:id/show' => 'user#show'
  get 'user/:id/listen' => 'user#follow', as: 'follow'
  get 'user/:id/ignore' => 'user#unfollow', as: 'unfollow'


  
   resources :comments do
   resources :comments
   end
  
  get 'comments/:id/upvotes' => 'comments#upvote', as: 'upvotecom'
  get 'comments/:id/downvotes' => 'comments#downvote', as: 'downvotecom'



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

  resources :tottles, :stores do
    resources :comments
  end
	
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
