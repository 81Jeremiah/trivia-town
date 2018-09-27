Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index, :show]


  get "/signin" to: 'sessions#new'
  post "/signin"  to:'sessions#create'
  delete "logout"  to: 'sessions#destroy'
  post "/rides/new" to: 'rides#new'


end
