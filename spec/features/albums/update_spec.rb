require 'rails_helper'

RSpec.describe 'Album Edit Page' do
  before :each do
    @beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50)
    @help = Album.create(title: 'Help', on_vinyl: true, number_of_tracks: 10, artist_id: @beatles.id)
  end

  describe 'user story 14' do
    it 'can edit an album and redirects to the albums show page with the updated attrs' do
      visit edit_album_path(@help)

      expect(page).to have_field("Title:")
      expect(page).to have_field("On vinyl?")
      expect(page).to have_field("Number of tracks:")

      fill_in 'Title:', with: 'Help!!!'
      uncheck 'On vinyl?'
      fill_in 'Number of tracks:', with: '12'

      click_on 'Update Album'

      expect(current_path).to eq("/albums/#{@help.id}")
      expect(page).to have_content('Help!!!')
      expect(page).to have_content('12')
      expect(page).to_not have_content('10')
      expect(page).to_not have_content('true')
    end
  end
end