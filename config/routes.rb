Rails.application.routes.draw do
  get 'products/index'
  root :to => 'mcsubscribe#index'
  post 'mcsubscribe/subscribe', to: 'mcsubscribe#subscribe'
  # root :to =>'mcsubscribe#launch'
  get 'mcsubscribe/launch'

  resources :products, only: [:index, :show]
  resources :purchases, only: [:create]
end
