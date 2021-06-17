Rails.application.routes.draw do
  root 'pages#home'
  get '/about', to: 'pages#about'
  resources :users
  get '/signup', to: 'users#new'
end
