Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :slacks
      resources :users
    end
  end

  get('/', { to: 'slacks#index', as: :root })

  resources :users, only: [:new, :create]
  resources :slacks, only: [:create, :new]

  resource :session, only: [:new, :create, :destroy]


end
