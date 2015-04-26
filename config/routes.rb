Rails.application.routes.draw do
   
  get 'sessions/new'

  post 'sessions/create'

  get 'sessions/destroy'

   resources :users
   resources :ribbits

   root to: 'users#new'
  
end
