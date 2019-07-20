Rails.application.routes.draw do
  root 'dashboard#index'

  namespace :api do
    resources :pages, only: :index
  end

  get '*path', to: 'api/pages#show'
end
