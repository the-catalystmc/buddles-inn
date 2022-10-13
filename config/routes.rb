Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :rooms do
    member do
      post :toggle_published
    end
  end
  root "rooms#index"
end
