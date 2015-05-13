Rails.application.routes.draw do
  root to: 'users#new'
  resources :users, only: [:new, :create, :destroy, :index]
  resource :session, only: [:new, :create, :destroy]
  resources :profiles, only: [:new, :create, :edit, :show]
end
