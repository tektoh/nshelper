Rails.application.routes.draw do
  resource :queries, only: [:show]
  root to: 'home#index'
end
