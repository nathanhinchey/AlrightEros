Rails.application.routes.draw do
  root to: "main#index"
  resources :users, only: [:new, :create, :destroy, :index]
  resource :session, only: [:new, :create, :destroy]
  resources :profiles, only: [:new, :create, :edit, :show, :index]
  namespace :api, defaults: {format: :json} do
    resources :profiles
  end
end
