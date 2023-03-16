Rails.application.routes.draw do
  root to: 'main#index'
  
  resources :components
  get '/cart', to: 'main#cart'
  get '/delivery', to: 'main#delivery'
  get '/support', to: 'main#support'
  get '/about', to: 'main#about'
end
