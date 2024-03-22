require 'rails_helper'

RSpec.describe 'Albums Index Page' do
  before :each do
    @beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50)
    @help = Album.create(title: 'Help', on_vinyl: true, number_of_tracks: 10, artist_id: @beatles.id)
    @abbey = Album.create(title: 'Abbey Road', on_vinyl: false, number_of_tracks: 12, artist_id: @beatles.id)
    @white = Album.create(title: 'The White Album', on_vinyl: true, number_of_tracks: 20, artist_id: @beatles.id)
  end

  # skipped due to updated requirements in US 14
  xdescribe 'User story 3' do
    it 'has all albums' do
      visit "/albums"

      expect(page).to have_content('Help')
      expect(page).to have_content('Abbey Road')
      expect(page).to have_content('The White Album')
    end
  end

  describe 'user story 14' do
    it 'displays only albums with true for on_vinyl attr' do
      visit "/albums" 

      expect(page).to have_content('Help')
      expect(page).to_not have_content('Abbey Road')
      expect(page).to have_content('The White Album')
    end
  end

  describe 'user story 18' do
    it 'has a link to each album edit page next to each album' do
      visit '/albums'

      within "#info_#{@help.id}" do
        expect(page).to have_link('Link to album edit page', href: edit_album_path(@help))
        expect(page).to_not have_link('Link to album edit page', href: edit_album_path(@abbey))
      end

      # within "#info_#{@abbey.id}" do
      #   expect(page).to have_link('Link to album edit page', href: edit_album_path(@abbey))
      # end

      # within "#info_#{@white.id}" do
      # expect(page).to have_link('Link to album edit page', href: edit_album_path(@white))
      # end
    end    
  end
end