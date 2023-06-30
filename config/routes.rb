Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  #buddies
  get "/buddies_lists", to: "buddies_lists#index"
  get "buddies_lists/:id", to: "buddies_lists#show", as: :buddy
  post "buddies_lists/:id", to: "buddies_lists#create", as: :create_buddy
  patch "buddies_lists/:id", to: "buddies_lists#update"

  #events
  resources :events do
    resources :bookings, except: [:destroy]
  end

  resources :bookings, only: [:destroy]

  #bookings
  # get "bookings/:id", to: "bookings#show", as: :new_booking

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
