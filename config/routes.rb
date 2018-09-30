Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index, :show]
  resources :quizzes
  #resources :games

  get "/signin", to: 'sessions#new'
  post "/signin",  to:'sessions#create'
  delete "logout",  to: 'sessions#destroy'
  post "/games/new" => 'games#new'


end
