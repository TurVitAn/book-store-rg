Rails.application.routes.draw do
  root 'homes#index'

  resources :books, only: %i[index show]
end
