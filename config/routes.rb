Rails.application.routes.draw do
  put 'cells/toggle'

  resources :games

  post 'games/:id/next_round' => 'games#next_round', as: :next_round
  root to: 'games#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
