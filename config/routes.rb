Rails.application.routes.draw do
  get '/', to: 'task#index'
  resources :tasks do
    collection do
      post :confirm
    end
  end
end
