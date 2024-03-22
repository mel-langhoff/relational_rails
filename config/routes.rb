Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/artists", to: "artists#index"
  get "/artists/new", to: "artists#new"
  get "/artists/:id", to: "artists#show"
  post "/artists", to: "artists#create"
  get "/artists/:id/edit", to: "artists#edit", as: :edit_artist
  patch "/artists/:id", to: "artists#update"
  delete "/artists/:id", to: "artists#destroy", as: :destroy_artist
  get "/search_artists", to: "artists#search"

  # as: :artist_albums => custom name to assign the route helper so it's artist_albums_path
  get "/artists/:artist_id/albums", to: "artist_albums#index", as: :artist_albums
  get "/artists/:artist_id/albums/new", to: "artist_albums#new", as: :new_artist_album
  post "/artists/:artist_id/albums", to: "artist_albums#create", as: :create_artist_album
  get "/artists/:artist_id/albums/sort", to: "artist_albums#sort", as: :sort_artist_albums
  get "/artists/:artist_id/albums/threshold_filter", to: "artist_albums#threshold_filter", as: :threshold_filter_artist_albums


  get "/albums", to: "albums#index"
  get "/albums/:id", to: "albums#show"
  get "/albums/:id/edit", to: "albums#edit", as: :edit_album
  patch "/albums/:id", to: "albums#update"
  delete "/albums/:id", to: "albums#destroy", as: :destroy_album

  get "/search_albums", to: "albums#search"
  
end
