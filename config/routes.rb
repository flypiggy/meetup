CourseProject::Application.routes.draw do
  root to: "posts#index"

  resources :users, only:[:create, :show, :edit]
  get "register", to: "users#new", as: "register"

  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"

  resources :posts, only: [:new, :create, :show] do
    resources :comments, only: [:create]
    resources :votes, only: [:create]
  end

end
