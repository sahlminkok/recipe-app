Rails.application.routes.draw do
  devise_for :users

  root 'foods#index'

  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :shopping_lists, only: [:index]
  resources :recipes, only: [:show, :destroy]
  get '/recipes', to: 'recipes#index', as: 'recipes'

  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'
end
