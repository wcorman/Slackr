Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :tokens, only: [:create]
      resources :users,  only: [:create]
      resources :slacks, only: [:index, :create] do
        get 'averages', on: :collection
        get 'trends', on: :collection
      end
      resources :tokens, only: [:create]
    end
  end

  get('/', { to: 'slacks#index', as: :root })

  resources :users, only: [:new, :create, :show]
  resources :slacks, only: [:create, :new]
  resource :session, only: [:new, :create, :destroy]
end
