# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

@beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50)
@zappa = Artist.create(name: 'Frank Zappa', still_recording: false, number_of_singles: 60)

@help = Album.create(title: 'Help', on_vinyl: true, number_of_tracks: 10, artist_id: @beatles.id)
@abbey = Album.create(title: 'Abbey Road', on_vinyl: false, number_of_tracks: 12, artist_id: @beatles.id)
@white = Album.create(title: 'The White Album', on_vinyl: true, number_of_tracks: 20, artist_id: @beatles.id)