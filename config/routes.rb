Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "buddies", to: "buddies#index"
  get "buddies/:id", to: "buddies#show", as: :buddy
  post "buddies/:id", to: "buddies#create", as: :create_buddy
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


end
