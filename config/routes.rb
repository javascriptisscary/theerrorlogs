Rails.application.routes.draw do


  get 'welcome/index'
  

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users do
    member do
      get :following, :followers, :edit_photo
    end
  end

  resources :posts 
  
  
  resources :relationships,  only: [:create, :destroy]

 
   
   
   
   
   
   root 'welcome#index'

end 