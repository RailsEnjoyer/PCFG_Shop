Rails.application.routes.draw do
  root to: 'main#index'
  
  get '/main', to: 'main#index'
  get '/catalogue', to: 'main#catalogue'
  get '/configurator', to: 'configurator#index'

  resources :components
  resources :catalogue
  resources :configurator
  resources :games

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update destroy]

  resources :rams
  resources :ssds
  resources :hdds
  resources :motherboards
  resources :cpus
  resources :gpus
  resources :power_supplies
  resources :rigs
  resources :coolers

  get '/main', to: 'components#show'
  get '/configurator', to: 'main#configurator'
  get '/cart', to: 'cart#index'
  get '/news', to: 'main#news'
  get '/support', to: 'main#support'
  get '/about', to: 'main#about'
  get '/login', to: 'main#login'
end
