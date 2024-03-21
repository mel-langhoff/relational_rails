require 'rails_helper'

RSpec.describe 'Artist Update Page' do
  before :each do
    @beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50, id: 1)
  end

  describe 'user story 12' do
    it 'has a form to update the artist attributes' do
      # visit "/artist/#{@beatles.id}/edit"
      visit edit_artist_path(@beatles)


      save_and_open_page
      expect(page).to have_field("Name:")
      expect(page).to have_field("Still recording?")
      expect(page).to have_field("Number of singles:")
    end

    it 'patches the updated attributes and redirects to the show page with the updated info' do
      # visit "/artist/#{@beatles.id}/edit"
      visit edit_artist_path(@beatles)


      fill_in 'name', with: 'Beatlezzz'
      check 'Still recording?'
      fill_in 'number_of_singles', with: '20'

      click_on 'Update Artist'

      expect(current_path).to eq("/artists")
      expect(page).to have_content('Beatlezzz')
      expect(page).to have_content('true')
      expect(page).to have_content('20')
    end
  end
end