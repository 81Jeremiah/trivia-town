Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index]
  resources :quizzes
  resources :games

  get "/signin", to: 'sessions#new'
  post "/signin",  to:'sessions#create'
  delete "logout",  to: 'sessions#destroy'
  #post "/games/new" => 'games#new'

  resources :users, only: [:show] do
    # nested resource for quizes
    resources :quizzes, only: [:show, :index]
  end

end
