Rails.application.routes.draw do
  get('/', { to: 'slacks#index', as: :root })




end
