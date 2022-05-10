Rails.application.routes.draw do
  get '/', to: 'tasks#index'
  resources :tasks do
    collection do
      post :confirm
    end
  end
  namespace :admin do
    resources :users
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
