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
  resources :users
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
  

  get 'session', to: 'sessions#new'
  get 'step1', to: 'configurator#step1'
  post 'step1_submit', to: 'configurator#step1_submit'
  get 'step2', to: 'configurator#step2'
  post 'step2_submit', to: 'configurator#step2_submit'
  get 'step3', to: 'configurator#step3'
  post 'step3_submit', to: 'configurator#step3_submit'
  get 'results', to: 'configurator#results'
  post 'results', to: 'configurator#results'
  patch '/users/:id', to: 'users#update', as: :update_user

  get '/step2', to: 'configurator#step2'
  get '/step3', to: 'configurator#step3'
  get '/main', to: 'components#show'
  get '/cart', to: 'cart#index'
  get '/news', to: 'main#news'
  get '/support', to: 'main#support'
  get '/about', to: 'main#about'
  get '/login', to: 'main#login'
end
