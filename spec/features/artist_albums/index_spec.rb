require 'rails_helper'

RSpec.describe "Artist Albums Index Page" do
  before :each do
    @beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50)
    @abbey = Album.create(id: 1, title: 'Abbey Road', on_vinyl: false, number_of_tracks: 12, artist_id: @beatles.id)
  end

  describe 'user story 10' do
    it 'exists and redirects to artist album index page' do
      visit "/artists/#{@beatles.id}"

      expect(page).to have_link("All Albums")

      click_on 'All Albums'

      expect(current_path).to eq("/artists/#{@beatles.id}/albums")
      expect(page).to have_content("Abbey Road")
    end
  end

  describe 'user story 13' do
    it 'has a link to add a new album for that particular artist' do
      visit "/artists/#{@beatles.id}/albums"

      expect(page).to have_link("Add Album For This Artist", href: new_artist_album_path(@beatles.id))
    end
  end
end