Rails.application.routes.draw do
  devise_for :users
  root 'crews#index'

  resources :users
  resources :crews do
    resources :events
  end
end
