require 'rails_helper'

RSpec.describe 'Album Show Page' do
  before :each do
    @beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50)
    @help = Album.create(title: 'Help', on_vinyl: true, number_of_tracks: 10, artist_id: @beatles.id)
    @abbey = Album.create(title: 'Abbey Road', on_vinyl: false, number_of_tracks: 12, artist_id: @beatles.id)
  end

  describe 'user story 4' do
    it 'displays all attributes of the album' do
      visit "/albums/#{@abbey.id}"

      expect(page).to have_content(@abbey.title)
      expect(page).to have_content(@abbey.on_vinyl)
      expect(page).to have_content(@abbey.number_of_tracks)
      expect(page).to have_content('The Beatles')
    end
  end

  describe 'user story 10' do
    it 'has a link to the artists album index page' do
      visit "/artists/#{@beatles.id}"

      expect(page).to have_link('All Albums', href: artist_albums_path(@beatles))

      click_on 'All Albums'

      expect(page).to have_content(@help.title)
      expect(page).to have_content(@help.number_of_tracks)
      expect(page).to have_content(@abbey.number_of_tracks)
    end
  end

  describe 'user story 14' do
    it 'has a link to update an album' do
      visit "/albums/#{@abbey.id}"

      expect(page).to have_link('Edit Album', href: edit_album_path(@abbey))
    end

    it 'has a link that redirects to the album edit page' do
      visit "/albums/#{@abbey.id}"

      click_on 'Edit Album'
      
      expect(current_path).to eq edit_album_path(@abbey)
    end
  end
end

