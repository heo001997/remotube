Rails.application.routes.draw do
  resources :users, only: :create do
    collection do
      get 'me'
      post 'logout'
    end
  end
  resources :videos, only: [:index, :create]
end
