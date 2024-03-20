require 'rails_helper'

RSpec.describe 'Artist Show Page' do
  before :each do
    @beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50)
  end

  describe 'user story 2' do
    it 'has all the artists attributes' do
      visit "/artists/#{@beatles.id}"

      expect(page).to have_content(@beatles.name)
      expect(page).to have_content(@beatles.still_recording)
      expect(page).to have_content(@beatles.number_of_singles)
    end
  end
end