require 'rails_helper'

RSpec.describe 'Artist New Page' do
  describe 'user story 11' do
    it 'has a form to create a new artist' do
      visit "/artists/new"

      expect(page).to have_button('Create Artist')
      expect(page).to have_field('Name')
      expect(page).to have_field()
    end

    it 'redirects to the artists index page after creation' do

    end

    it 'posts the new artist on the artist index page' do
      
    end
  end
end