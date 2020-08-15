Rails.application.routes.draw do
  post '/callback', to: 'linebot#callback' #/callbackにLINEからアクセスがあった時。
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end
  resources :stocks do
    collection {post :import}
  end
  
  root to: 'sessions#new'
end
