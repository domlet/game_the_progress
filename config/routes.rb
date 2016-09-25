Rails.application.routes.draw do
  get 'imported_games/index'

  get 'create_imported_games/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'

  resources :games, only: [:index, :show]
  resources :results
  resources :questions
  resources :answers

  root to: 'games#index'

  resources :imported_games do
    collection { post :import }
  end

end
