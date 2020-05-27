Rails.application.routes.draw do
  devise_for :users
  root 'crews#index'
end
