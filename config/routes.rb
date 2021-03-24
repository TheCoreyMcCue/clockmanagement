Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # devise_for :users
  root to: 'pages#home'
  get "pages/plug" => "pages#plug"
  get "pages/podcast" => "pages#podcast"
  get "pages/about" => "pages#about"
  get "pages/rankings" => "pages#rankings"
  resources :blogs do
  end
end
