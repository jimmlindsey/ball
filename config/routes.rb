Rails.application.routes.draw do
  resources :posts
  devise_for :users
  
  resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end
  
  root to: "posts#index"
end
