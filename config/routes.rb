Rails.application.routes.draw do
  get 'sessions/new'
  namespace :admin do
    resources :users
  end
  resources :stocks
  root 'stocks#index'
end
