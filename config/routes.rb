Rails.application.routes.draw do
  get 'welcome/index'

  get 'posts/show'


  devise_for :users
  
   
   resources  :posts
   
   
   
   root 'welcome#index'

end 