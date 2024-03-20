require 'rails_helper'

RSpec.describe 'Album Show Page' do
  before :each do
    @beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50)
    @abbey = Album.create(id: 1, title: 'Abbey Road', on_vinyl: false, number_of_tracks: 12, artist_id: @beatles.id)
  end

  describe 'user story 4' do
    it 'displays all attributes of the album' do
      visit "/albums/1"

      expect(page).to have_content(@abbey.title)
      expect(page).to have_content(@abbey.on_vinyl)
      expect(page).to have_content(@abbey.number_of_tracks)
      expect(page).to have_content('The Beatles')
    end
  end
end

