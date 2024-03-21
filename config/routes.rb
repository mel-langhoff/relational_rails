Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/artists", to: "artists#index"
  get "/artists/:id", to: "artists#show"
  # User Story 5
  get "/artists/:artist_id/albums", to: "albums#index", as: :artist_albums
  # as: :artist_albums => custom name to assign the route helper so it's artist_albums_path

  get "/albums", to: "albums#index"
  get "/albums/:id", to: "albums#show"
end
