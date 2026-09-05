Rails.application.routes.draw do
  devise_for :users

  root 'foods#index'

  resources :foods, only: [:index, :show, :new, :create, :destroy]

  get '/general_shopping_list', to: 'shopping_lists#index', as: 'general_shopping_list'

  resources :recipes, only: [:show, :destroy, :create, :new] do
    member do
      patch 'toggle_public'
    end  
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  get '/all_recipes', to: 'recipes#index', as: 'all_recipes'

  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'
end
