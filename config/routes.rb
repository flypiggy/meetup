CourseProject::Application.routes.draw do
  root to: "posts#index"

  resources :users, only:[:create]
  get "register", to: "users#new", as: "register"

  resources :posts, only: [:new, :create, :show] do
    resources :comments, only: [:create]
    resources :votes, only: [:create]
  end

end
