require 'rails_helper'

RSpec.describe "Artist Index Page", type: :feature do
  before :each do
    @beatles = Artist.create(id: 1, name: 'The Beatles', still_recording: false, number_of_singles: 50)
    @zappa = Artist.create(id: 2, name: 'Frank Zappa', still_recording: false, number_of_singles: 60)
  
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
      visit '/artists'

      expect(page).to have_link('Create new artist', href: "/artists/new")
    end

    it 'redirects to the artists/new page' do

    end
  end

  describe 'user story 17' do
    it 'has a link to each artists edit page next to each artist' do
      visit '/artists'

      within "#info_#{@beatles.id}" do
        expect(page).to have_link('Link to artist edit page', href: edit_artist_path(@beatles))
      end

      within "#info_#{@zappa.id}" do
        expect(page).to have_link('Link to artist edit page', href: edit_artist_path(@zappa))
      end
    end
  end

  describe 'user story 22' do
    it 'has a link to delete the artist with every artist listed' do
      visit '/artists'

      within "#info_#{@beatles.id}" do
        expect(page).to have_link('Link to delete artist', href: destroy_artist_path(@beatles))
      end

      within "#info_#{@zappa.id}" do
        expect(page).to have_link('Link to delete artist', href: destroy_artist_path(@zappa))
      end
    end
  end
end