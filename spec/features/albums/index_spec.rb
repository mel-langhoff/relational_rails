require 'rails_helper'

RSpec.describe 'Albums Index Page' do
  before :each do
    @beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50)
    @help = Album.create(title: 'Help', on_vinyl: true, number_of_tracks: 10, artist_id: @beatles.id)
    @abbey = Album.create(title: 'Abbey Road', on_vinyl: false, number_of_tracks: 12, artist_id: @beatles.id)
    @white = Album.create(title: 'The White Album', on_vinyl: true, number_of_tracks: 20, artist_id: @beatles.id)
  end

  describe 'User story 3' do
    it 'has all albums' do
      visit "/albums"

      expect(page).to have_content('Help')
      expect(page).to have_content('Abbey Road')
      expect(page).to have_content('The White Album')
    end
  end
end