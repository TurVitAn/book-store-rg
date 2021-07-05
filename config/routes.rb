Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  root 'homes#index'
  get 'privacy_policy', to: 'homes#privacy_policy'

  resources :books, only: %i[index show]
  resources :addresses, only: :create
  resources :settings, only: :index
  resources :reviews, only: :create
  resources :order_items, only: %i[create update destroy]
  resources :orders, only: %i[index show]
  resources :checkouts, param: :step, only: %i[show update]
  resource :cart, only: :show
  resource :coupon, only: :update

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  mount ImageUploader.derivation_endpoint => '/derivations/image'
end
