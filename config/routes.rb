Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
  get "/manager_dashboard", to: "dashboard#manager_index"

  resources :workers, only: [:new, :create]
end
