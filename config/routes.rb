Rails.application.routes.draw do
  resources :movies
  resources :users

  root "home#login"
  post "authenticate", to: "home#authenticate"
  get "home/homepage", to: "home#homepage" # Página após login

  get "up" => "rails/health#show", as: :rails_health_check
end
