Rails.application.routes.draw do
  root to: "main#index"

  namespace :api, defaults: {format: :json} do
    resources :profiles, only: [:create, :update, :show, :index]
    resource :session, only: [:create, :show, :destroy]
    resources :questions, only: [:create, :show, :index]
    resources :messages, only: [:create, :index, :show]

    resources :users, only: [:create] do
      resources :user_answers, only: [:create, :index] #TODO: add update
    end

  end
  # Note: for a real app, I'd do something to let it be indexed
  # Although for this particular app, that would be irrelevant, as
  # only the root is accessible without login.
  # get '*path' => "main#index"

  # resources :users, only: [:new, :create, :destroy, :index]
  # resource :session, only: [:new, :create, :destroy]
  # resources :profiles, only: [:new, :create, :edit, :show, :index]

end
