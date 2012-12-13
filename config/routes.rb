CourseProject::Application.routes.draw do
  root to: "posts#index"
  resources :posts, only: [:new, :create, :show] do
    resources :comments, only: [:create]
    resources :votes, only: [:create]
  end
end
