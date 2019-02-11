Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "static_pages/*page" => "static_pages#show"
    get "/signup", to: "user#new"
    post "/signup",  to: "user#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout",  to: "sessions#destroy"
    resources :user
  end
end
