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

  post '/step1', to: 'configurator#step1'
  get '/step1', to: 'configurator#step1'
  post '/step2', to: 'configurator#step2'
  get '/step2', to: 'configurator#step2'
  post '/step3', to: 'configurator#step3'
  get '/step3', to: 'configurator#step3'
  post '/results', to: 'configurator#results'
  get '/results', to: 'configurator#results'

  get '/step2', to: 'configurator#step2'
  get '/step3', to: 'configurator#step3'
  get '/main', to: 'components#show'
  get '/cart', to: 'cart#index'
  get '/news', to: 'main#news'
  get '/support', to: 'main#support'
  get '/about', to: 'main#about'
  get '/login', to: 'main#login'
end
