Rails.application.routes.draw do
  root 'application#home', as: 'home'

  resources :player
  post 'player/create', to: 'player#create', as: 'create_player'
end
