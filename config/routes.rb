Rails.application.routes.draw do
  get 'contests/index'

  post 'mcsubscribe/subscribe', to: 'mcsubscribe#subscribe'
  root :to =>'mcsubscribe#launch'
  get 'mcsubscribe/launch'
  get 'mcsubscribe/index'
  get 'success', to: 'products#success'

  resources :products, only: [:index, :show]
  resources :purchases, only: [:new, :create]
end
