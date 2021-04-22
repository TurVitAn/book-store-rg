Rails.application.routes.draw do
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  root 'homes#index'
  get 'privacy_policy', to: 'homes#privacy_policy'

  resources :books, only: %i[index show]
  resources :addresses, only: :create
  resources :settings, only: :index

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
