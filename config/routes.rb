Rails.application.routes.draw do
  # get 'reizoko/index'
  root 'reizoko#index'
  resources :reizoko
end
