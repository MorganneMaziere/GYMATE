Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  #buddies
  get "/buddies_lists", to: "buddies_lists#index"
  get "buddies_lists/:id", to: "buddies_lists#show", as: :buddy
  post "buddies_lists/:id", to: "buddies_lists#create", as: :create_buddy

  #events
  get "events", to: "events#index"
  get "events/:id", to: "events#show", as: :new_event

  #bookings
  get "bookings/:id", to: "bookings#show", as: :new_booking

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :event do
    resources :bookings, only: %i[show new create]
  end
  resources :bookings, only: %i[edit update destroy]

end
