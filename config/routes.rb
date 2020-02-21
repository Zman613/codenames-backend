Rails.application.routes.draw do
  resources :spy_messages
  resources :messages
  resources :users
  resources :cards
  resources :rooms
  resources :words
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'

  get '/join-room', to: 'rooms#join_room'
  patch '/click', to: 'rooms#click'
  patch '/new-game', to: 'rooms#new_game'
end
