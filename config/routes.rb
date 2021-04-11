Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'homes#index'

  resources :books, only: %i[index show]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
