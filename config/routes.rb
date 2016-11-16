Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # login route
  post "users/login", to: "users#login", defaults:{format: :json}

  # user routes
  get "users/:id", to: "users#show", defaults:{format: :json}
  get "users", to: "users#index", defaults:{format: :json}
  # resources :users

  # absence routes
  post "absences", to:"absences#create", defaults:{format: :json}
  # resources :absences

  post "upload/proof", to:"sellouts#upload_photo", defaults:{format: :json}
  post "/test", to: "sellouts#asd", defaults:{format: :json}
end
