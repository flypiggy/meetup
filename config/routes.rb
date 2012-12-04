CourseProject::Application.routes.draw do
  root to: "posts#index"
  resources :posts do
    resources :comments, :only=>[:new, :create]
  end
end
