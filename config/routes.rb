Rails.application.routes.draw do
  get "users/login"
  post "users/process_login"
  get "users/logout"
  resources :users
  resources :barks
  resources :timelines

  root :to => "barks#index"
end
