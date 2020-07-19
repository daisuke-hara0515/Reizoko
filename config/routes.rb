Rails.application.routes.draw do
  post '/callback' => 'linebot#callback' #/callbackにLINEからアクセスがあった時。
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end
  resources :stocks
  root to: 'sessions#new'
end
