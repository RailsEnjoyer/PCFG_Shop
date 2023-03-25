Rails.application.routes.draw do
  root to: 'main#index'
  
  get '/main', to: 'main#index'
  get '/catalogue', to: 'main#catalogue'
  resources :components


  get '/main', to: 'components#show'
  get '/cart', to: 'cart#index'
  get '/news', to: 'main#news'
  get '/support', to: 'main#support'
  get '/about', to: 'main#about'
  get '/configurator', to: 'main#configurator'
  get '/login', to: 'main#login'
end
