Rails.application.routes.draw do
  root to: 'main#index'
  
  resources :components

  get '/cart', to: 'main#cart'
  get '/news', to: 'main#news'
  get '/support', to: 'main#support'
  get '/about', to: 'main#about'
  get '/configurator', to: 'main#configurator'
  get '/login', to: 'main#login'
end
