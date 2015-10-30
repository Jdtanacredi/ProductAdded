Rails.application.routes.draw do
  post 'mcsubscribe/subscribe', to: 'mcsubscribe#subscribe'
  root :to =>'mcsubscribe#launch'
  get 'mcsubscribe/launch'
  get 'mcsubscribe/index'
  get 'success', to: 'products#success'
  get 'contests/index'
  get 'contest-success', to: 'contests#success'

  resources :products, only: [:index, :show]
  resources :purchases, only: [:new, :create]
end
