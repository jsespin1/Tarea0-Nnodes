Rails.application.routes.draw do
  root 'application#home', as: 'home'

  resources :player
  post 'player/create', to: 'player#create', as: 'create_player'

  get 'roulette/increase' => 'roulette#increase', as: 'roulette_increase_balance'

  get 'roulette/new_round' => 'roulette#new_round', as: 'roulette_new_round'

end
