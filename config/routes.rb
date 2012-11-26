CourseProject::Application.routes.draw do
  root to: "main#index"
  match "posts/:id" => "main#show"
end
