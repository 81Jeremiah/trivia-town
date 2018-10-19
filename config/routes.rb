Rails.application.routes.draw do
  root 'quizzes#index'
  get "games/games_score", to: 'games#games_score'
  resources :users, only: [:new, :create, :index, :show]

  get "quizzes/top_quizzes", to: 'quizzes#top_quizzes'

  resources :quizzes

  resources :quizzes, only: :show do
  	resources :games, only: [:new, :show]
  end

  resources :quizzes, only: :index do
    resources :categories, path: "/", :only => [:index, :show]
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
