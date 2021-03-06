Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  root 'home#index'
  resources :subscriptions, only: [:index, :create]
  resources :payments
  resources :conversations
  # devise_for :users, controllers: {
  #   omniauth_callbacks: 'users/omniauth_callbacks',
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations'
  # }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
