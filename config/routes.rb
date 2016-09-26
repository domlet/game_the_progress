Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'

  resources :games, only: [:index, :show]
  resources :results
  resources :questions
  resources :answers

  # get 'graph/index'
  # get 'graph/data', defaults: { format: 'json' }

  root to: 'games#index'

end
