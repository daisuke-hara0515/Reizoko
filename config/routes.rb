Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  resources :stocks
  root 'stocks#index'
end
