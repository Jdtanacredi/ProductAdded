Rails.application.routes.draw do
  post 'mcsubscribe/subscribe', to: 'mcsubscribe#subscribe'
  root :to =>'mcsubscribe#launch'
  get 'mcsubscribe/launch'

  resources :products, only: [:index, :show]
  resources :purchases, only: [:new, :create]
end
