Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # login route
  post "login", to: "users#login", defaults:{format: :json}
  post "logout", to: "users#logout", defaults:{format: :json}

  # user routes
  get "users/:id", to: "users#show", defaults:{format: :json}
  get "users", to: "users#index", defaults:{format: :json}
  # resources :users

  # absence routes
  post "absences", to:"absences#create", defaults:{format: :json}
  # resources :absences

  # sellout routes
  post "sellouts/create", to: "sellouts#create", defaults:{format: :json}
end
