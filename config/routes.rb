Rails.application.routes.draw do
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
  end
  resources :categories
  resources :accounts, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'accounts#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as:'logout'
  resources :stories

end
