Rails.application.routes.draw do
  root 'foods#index'
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'
end
