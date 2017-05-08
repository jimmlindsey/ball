Rails.application.routes.draw do
  resources :posts
  devise_for :users, 
                     :path => '', 
                     :path_names => {:sign_in => 'login', :sign_up => 'signup', :sign_out => 'logout', :edit => 'profile'}
  
  resources :users, only: [:show]
  
  resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end
  
  root to: "posts#index"
end
