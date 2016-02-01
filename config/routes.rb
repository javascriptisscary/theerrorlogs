Rails.application.routes.draw do


  get 'welcome/index'

  resources :users
  resources :posts 


  devise_for :users
   
  
   
   
   
   
   root 'welcome#index'

end 