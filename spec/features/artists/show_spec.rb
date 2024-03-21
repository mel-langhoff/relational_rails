require 'rails_helper'

RSpec.describe 'Artist Show Page' do
  before :each do
    @beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50, id: 1)
  
    @help = Album.create(title: 'Help', on_vinyl: true, number_of_tracks: 10, artist_id: @beatles.id)
    @abbey = Album.create(title: 'Abbey Road', on_vinyl: false, number_of_tracks: 12, artist_id: @beatles.id)
    @white = Album.create(title: 'The White Album', on_vinyl: true, number_of_tracks: 20, artist_id: @beatles.id)
  end

  describe 'user story 2' do
    it 'has all the artists attributes' do
      visit "/artists/#{@beatles.id}"

      expect(page).to have_content(@beatles.name)
      expect(page).to have_content(@beatles.still_recording)
      expect(page).to have_content(@beatles.number_of_singles)
    end
  end

  describe 'user story 7' do
    it 'has an album count' do
      visit "/artists/#{@beatles.id}"
      
      expect(page).to have_content(3)
    end
  end

  describe 'user story 12' do
    it 'has a link to update the artist' do
      visit "/artists/#{@beatles.id}"

      expect(page).to have_link("Update Artist")

      click_on 'Update Artist'

      expect(current_path).to eq("/artists/#{@beatles.id}/edit")
    end
  end
end