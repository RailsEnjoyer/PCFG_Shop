Rails.application.routes.draw do
  root to: 'components#index'
  
  resources :components
end
