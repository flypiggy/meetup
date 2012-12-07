CourseProject::Application.routes.draw do
  root to: "posts#index"
  resources :posts, only: [:new, :create, :show] do
    resources :comments, only: [:create]
    match "vote_up" => "votes#vote_up", as: :voteup, via: :post
    match "vote_down" => "votes#vote_down", as: :votedown, via: :post
  end
end
