Rails.application.routes.draw do
  resources :stocks
  root 'stocks#index'
  post 'stocks/new'
end
