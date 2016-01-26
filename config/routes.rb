Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

  get 'users/create'

  get 'users/update'

  get 'users/destroy'

  get 'welcome/index'

  get 'posts/show'


  devise_for :users
  
   
   resources  :posts
   
   
   
   root 'welcome#index'

end 