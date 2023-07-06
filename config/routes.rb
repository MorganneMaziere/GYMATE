Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  #buddies
  # get "/buddies_lists", to: "buddies_lists#index"
  # get "buddies_lists/:id", to: "buddies_lists#show", as: :buddy
  # post "buddies_lists/:id", to: "buddies_lists#create", as: :create_buddy
  # patch "buddies_lists/:id", to: "buddies_lists#update"

  get "dashboard", to: "pages#dashboard"

  #events
  resources :events do
    resources :bookings, except: [:destroy]
  end

  resources :buddies_lists do
    resources :reviews, only: %i[new create]
    resources :chatrooms, only:  %i[show create] do
      resources :messages, only: :create
    end
  end

  resources :bookings, only: [:destroy]

  resources :reviews, only: :destroy

  resources :chatrooms do
    resources :messages
  end

  #bookings
  # get "bookings/:id", to: "bookings#show", as: :new_booking

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
