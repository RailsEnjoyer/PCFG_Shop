Rails.application.routes.draw do
  resources :line_items
  resources :carts
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
  resources :line_items, only: [:create, :update, :destroy]

  resources :rams
  resources :ssds
  resources :hdds
  resources :motherboards
  resources :cpus
  resources :gpus
  resources :power_supplies
  resources :rigs
  resources :coolers

  delete 'line_items/destroy_all', to: 'line_items#destroy_all', as: 'destroy_all_line_items'

  get '/carts', to: 'carts#index'
  get 'session', to: 'sessions#new'
  get 'step1', to: 'configurator#step1'
  post 'step1_submit', to: 'configurator#step1_submit'
  get 'step2', to: 'configurator#step2'
  post 'step2_submit', to: 'configurator#step2_submit'
  get 'step3', to: 'configurator#step3'
  post 'step3_submit', to: 'configurator#step3_submit'
  get 'results', to: 'configurator#results'
  post 'results', to: 'configurator#results'

  get '/step2', to: 'configurator#step2'
  get '/step3', to: 'configurator#step3'
  get '/main', to: 'components#show'
  get '/cart', to: 'cart#index'
  get '/news', to: 'main#news'
  get '/support', to: 'main#support'
  get '/about', to: 'main#about'
  get '/login', to: 'main#login'
end
