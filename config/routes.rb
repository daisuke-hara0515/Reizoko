Rails.application.routes.draw do
  # get 'reizoko/index'
  get "reizoko/form"
  resources :reizoko
end
