Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # login route
  post "users/login", to: "users#login"

  # user routes
  get "users/:id", to: "users#show"
  get "users", to: "users#index"
  # resources :users

  # absence routes
  post "absences", to:"absences#create"
  # resources :absences

  post "test", to:"sellouts#asd"
end
