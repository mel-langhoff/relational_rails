require 'rails_helper'

RSpec.describe "Artist Index Page", type: :feature do
  before :each do
    @beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50)
    @zappa = Artist.create(name: 'Frank Zappa', still_recording: false, number_of_singles: 60)
  
    @help = Album.create(title: 'Help', on_vinyl: true, number_of_tracks: 10, artist_id: @beatles.id)
    @abbey = Album.create(title: 'Abbey Road', on_vinyl: false, number_of_tracks: 12, artist_id: @beatles.id)
    @white = Album.create(title: 'The White Album', on_vinyl: true, number_of_tracks: 20, artist_id: @beatles.id)
  end

  describe 'user story 1' do
    it 'displays a list of all artists' do
      visit '/artists'

      expect(page).to have_content('The Beatles')
      expect(page).to have_content('Frank Zappa')
    end
  end

  describe 'user story 6' do
    it 'displays a list of all artists by most recently created' do
      visit '/artists'

      # alphabetical by first letter of the name attribute
      expect('Frank Zappa').to appear_before('The Beatles')
    end
  end

  describe 'user story 11' do
    it 'has a link to create a new artist' do
      
    end

    it 'redirects to the artists/new page' do

    end
  end
end