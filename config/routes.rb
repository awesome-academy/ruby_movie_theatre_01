Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "static_pages/*page" => "static_pages#show"
    get "/theater", to: "static_pages#theater"
    get "/ticket-price", to: "static_pages#ticketprice"
    get "/signup", to: "users#new"
    post "/signup",  to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout",  to: "sessions#destroy"
    resources :users
    resources :tickets, except: %i(update destroy)
    resources :films, only: %i(index show)
    resources :schedules, only: %i(index show)
    resources :posters, only: %i(new create)
    namespace :admin do
      resources :films
      resources :schedules
    end
  end
end
