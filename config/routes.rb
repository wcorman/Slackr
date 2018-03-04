Rails.application.routes.draw do
  get('/', { to: 'slacks#index', as: :root })

  resources :users, only: [:new, :create]
  # resource :session, only: [:new, :create, :destroy]

  resource :session, only: [:new, :create, :destroy]


end
