Rails.application.routes.draw do
  root 'dashboard#index'

  namespace :api do
    resources :pages, only: :index
  end

  get '*path', to: 'pages#show'
end
