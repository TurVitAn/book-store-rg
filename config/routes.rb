Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/passwords' }

  root 'homes#index'
  get 'privacy_policy', to: 'homes#privacy_policy'

  resources :books, only: %i[index show]
  resources :addresses, only: :create
  resources :settings, only: :index
  resources :reviews, only: :create
  resources :carts, only: :show
  resources :cart_items, only: %i[create destroy]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  mount ImageUploader.derivation_endpoint => '/derivations/image'
end
