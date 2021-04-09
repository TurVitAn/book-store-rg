Rails.application.routes.draw do
  devise_for :users

  root 'homes#index'

  resources :books, only: %i[index show]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
