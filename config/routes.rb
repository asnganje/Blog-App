Rails.application.routes.draw do
  # devise_for :views
  devise_for :users
  root "users#index"
  get 'users/show'
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create]    
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
