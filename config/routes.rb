Rails.application.routes.draw do
  get('/', { to: 'slacks#index', as: :root })

  resources :users, only: [:new, :create]
  resources :slacks, only: [:create, :new]

  resource :session, only: [:new, :create, :destroy]


end
