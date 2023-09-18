Rails.application.routes.draw do
  get 'food/index'
  get 'food/show'
  root 'food#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
