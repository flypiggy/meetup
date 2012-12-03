CourseProject::Application.routes.draw do
  root to: "posts#index"
  match "/post/:id" ,to: "posts#show", as: "post"
  resources :posts
end
