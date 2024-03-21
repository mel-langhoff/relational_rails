require 'rails_helper'

RSpec.describe 'Artist New Page' do
  describe 'user story 11' do
    it 'has a form to create a new artist' do
      visit "/artists/new"

      expect(page).to have_button('Create Artist')
      expect(page).to have_field('Name:')
      expect(page).to have_field('On Vinyl?')
      expect(page).to have_field('Number of tracks:')

      fill_in 'name', with: 'The Beatles'
      fill_in 'on_vinyl', with: 'true'
      fill_in 'number_of_tracks', with: '50'

      click_on 'Create Artist'

      expect(current_path).to eq("/artists")
      expect(page).to have_content('The Beatles')
      expect(page).to have_content('true')
      expect(page).to have_content('50')
    end

    it 'redirects to the artists index page after creation' do

    end

    it 'posts the new artist on the artist index page' do
      
    end
  end
end