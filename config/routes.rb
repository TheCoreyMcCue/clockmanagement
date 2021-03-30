Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # devise_for :users
  root to: 'pages#home'
  get "pages/plug" => "pages#plug"
  get "pages/podcast" => "pages#podcast"
  get "pages/about" => "pages#about"
  get "pages/pace" => "pages#pace"
  get "/youtube_sessions" => "youtube_sessions#new"
  get "/youtube_sessions/callback" => "youtube_sessions#callback"

  # get "pages/rankings" => "pages#rankings"
  resources :rankings
  resources :blogs
end
