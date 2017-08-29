Rails.application.routes.draw do
  root 'application#index'
  resources :users, exclude: [:index]

  resources :groups
  post 'groups' => 'groups#create'
  delete 'groups/:id' => 'groups#destroy'

  get 'groups/:id/user' => 'joins#create'
  delete 'groups/:id/user' => 'joins#destroy'

  get 'groups/:id' => 'groups#show'

  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
