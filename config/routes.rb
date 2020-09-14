Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pokeggs
  resources :users

  resources :orders, only: [:show, :create]
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
    mount StripeEvent::Engine, at: '/stripe-webhooks'
end
