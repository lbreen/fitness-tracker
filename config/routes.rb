Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: :dashboard

  resources :exercises, except: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
