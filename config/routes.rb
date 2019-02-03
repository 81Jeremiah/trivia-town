Rails.application.routes.draw do
  resources :handelbars, only: :index
  root 'home#index'
  get "games/games_score", to: 'games#games_score'
  get '/users/games_users_played', to: 'users#games_users_played'
  get '/users/quizzes_user_created', to: 'users#quizzes_user_created'
  get '/quizzes/comment_form', to: 'quizzes#comment_form'
  get '/quizzes/categories', to: 'categories#index'
  get '/categories/searchbar', to: 'categories#searhBar'

  resources :quizzes

  resources :users, only: [:new, :create, :index, :show]

  get "quizzes/top_quizzes", to: 'quizzes#top_quizzes'

  resources :quizzes, only: :index do
    resources :categories, path: "/", :only => [:index, :show]
  end


  resources :quizzes, only: :show do
  	resources :games, only: [:new, :show]
  end



  resources :quizzes, only: :show do
    resources :comments, only: :create
  end


  resources :games, only: :create


  get "/login", to: 'sessions#new'
  post "/login",  to:'sessions#create'
  delete "logout",  to: 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'

end
