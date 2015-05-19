Rails.application.routes.draw do
  root to: "main#index"

  namespace :api, defaults: {format: :json} do
    resources :profiles
    resource :session
    resources :questions

    resources :users, only: [:create] do
      resources :user_answers, only: [:create, :index]
    end

  end

  # resources :users, only: [:new, :create, :destroy, :index]
  # resource :session, only: [:new, :create, :destroy]
  # resources :profiles, only: [:new, :create, :edit, :show, :index]

end
