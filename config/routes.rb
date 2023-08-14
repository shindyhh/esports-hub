Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  get 'profile', to: 'pages#profile'
  get 'chatrooms', to: 'chatrooms#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts, only: [:index, :destroy, :create, :show] do

    resources :likes, only: [:create]
    resources :comments, only: [:index, :create]
  end

  resources :likes, only: [:destroy] do

    resources :comments, only: [:index, :create]
  end

  resources :comments, only: [ :destroy, :show]

  resources :teams, only: [ :create, :new, :destroy, :show ] do
    resources :memberships, only: :create
    resources :chatroom_teams, only: :create
  end

  resources :chatroom_teams, only: :show do
    resources :message_teams, only: :create
  end

  resources :users do
    resources :follows, only: [:create]
    resources :chatrooms, only: [:create]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :follows, only: [:destroy]
end
