require 'rails_helper'

RSpec.describe "Artist Albums Index Page" do
  before :each do
    @beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50)
    @help = Album.create(title: 'Help', on_vinyl: true, number_of_tracks: 10, artist_id: @beatles.id)
    @abbey = Album.create(title: 'Abbey Road', on_vinyl: false, number_of_tracks: 12, artist_id: @beatles.id)
    @white = Album.create(title: 'The White Album', on_vinyl: true, number_of_tracks: 20, artist_id: @beatles.id)
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

  describe 'user story 16' do
    it 'sorts the albums alphabetically on a new page' do
      visit "/artists/#{@beatles.id}/albums"

      click_on 'Sort Alphabetically'

      expect(@abbey.title).to appear_before(@help.title)
      expect(@help.title).to appear_before(@white.title)
    end
  end

  describe 'user story 21' do
    it 'has a search form that only allows number input for number of tracks' do
      visit "/artists/#{@beatles.id}/albums"

      expect(page).to have_field('Number of tracks threshold:')
      expect(page).to have_button('Search')

      fill_in 'Number of tracks threshold:', with: "12"
      click_on "Search"

      expect(page).to have_content('Abbey Road')
      expect(page).to have_content('Help')
    end
  end
end