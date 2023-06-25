Rails.application.routes.draw do
  resources :clients, except: [:new, :edit]

  resources :products, except: [:new, :edit]

  resources :purchases, except: [:new, :edit]

  get '/months_with_purchases', to: 'purchases#months_with_purchases'
end