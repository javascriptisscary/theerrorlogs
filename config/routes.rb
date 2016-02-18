Rails.application.routes.draw do


  get 'welcome/index'
  

  devise_for :users

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :posts 
  
  
  resources :relationships,  only: [:create, :destroy]

 
   
  
   
   
   
   
   root 'welcome#index'

end 