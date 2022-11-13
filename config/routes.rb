Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :rooms
  resources :rentals
  get 'contact', to: 'contact#index', as: :contact
  root "rooms#index"
end
