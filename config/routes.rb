Rails.application.routes.draw do
  get 'sessions/new'
  get '/', to: 'tasks#index'
  resources :tasks do
    collection do
      post :confirm
    end
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
