Rails.application.routes.draw do
  # get 'user/new'
  # get 'user/show'
  # get 'sessions/new'

  get '/signup',      to: 'users#new'
  post '/signup',     to: 'users#create'
  get '/login',       to: 'sessions#new'
  post '/login',      to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  root 'sessions#new'

  get '/postlist', to: 'posts#index'
  get     '/posts',      to: 'posts#new'
  post    '/posting',      to: 'posts#create'
  get '/postboard' => 'posts#new'
  
  #i need to specify '/login ' for user  create
  # and '/postboard' for sessions after login to go create a post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 #and also include postlist path for post#create controller
  resources  :users
  resources :posts
end
