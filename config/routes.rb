Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "/", to: "welcomes#index"
  post "users/login", to: "users#login"
  resources :users
end
