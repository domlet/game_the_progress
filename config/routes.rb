Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :graph, only: [:index, :show]

  mount ActionCable.server => '/cable'

  # Show for individual student
  get 'graph/student/:id', to: 'graph#show'

  # Show graph for entire class
  get 'graph/students', to: 'graph#students'


  # match 'graph/show' => 'graph#show', :via => :get
  # match 'graph/index' => 'graph#index', :via => :get
  # Custom Example
  # get '/patients/:id', to: 'patients#show'

  resources :games, only: [:index, :show]
  resources :results
  resources :questions
  resources :answers
  resources :users, only: [:show, :edit]

  root to: 'games#index'

end
