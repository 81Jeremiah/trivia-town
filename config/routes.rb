Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index]
  resources :quizzes
  resources :games

  resources :quizzes, only: [:show] do
  	resources :games, only: [:new]
  end
  
  get "/login", to: 'sessions#new'
  post "/login",  to:'sessions#create'
  delete "logout",  to: 'sessions#destroy'
  #post "/games/new" => 'games#new'
  get '/auth/facebook/callback' => 'sessions#create'

  resources :users, only: [:show] do
    # nested resource for quizes
    resources :quizzes, only: [:show, :index]
  end

  root 'quizzes#index'

  resources :quizzes, :only => [:index] do
    resources :categories, :path => "/", :only => [:index, :show]
  end

  resources :quizzes, only: :show do
    resources :comments, only: :create
  end
end
