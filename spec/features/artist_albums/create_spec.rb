require 'rails_helper'

RSpec.describe "Artist Album New Page" do
  before :each do
    @beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50)
    @abbey = Album.create(id: 1, title: 'Abbey Road', on_vinyl: false, number_of_tracks: 12, artist_id: @beatles.id)
    @white = Album.create(title: 'The White Album', on_vinyl: true, number_of_tracks: 20, artist_id: @beatles.id)
  end
  describe 'user story 13' do
    it 'has a form to create a new album for this artist' do
      visit new_artist_album_path(@beatles)

      expect(page).to have_button('Add Album')
      expect(page).to have_field("Title:")
      expect(page).to have_field("On vinyl?")
      expect(page).to have_field("Number of tracks:")
    end

    it 'creates a new album for the artist and posts request to artist album index page and is displayed after creation' do
      visit new_artist_album_path(@beatles)

      fill_in 'title', with: 'Help'
      fill_in 'number_of_tracks', with: 12

      click_on 'Add Album'

      expect(current_path).to eq(artist_albums_path(@beatles))
      expect(page).to have_content("Help")
      expect(page).to have_content("12")
      expect(page).to have_content("Abbey Road")
      expect(page).to have_content("The White Album")
    end
  end
end