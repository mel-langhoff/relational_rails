require 'rails_helper'

RSpec.describe "Artist Index Page", type: :feature do
  before :each do
    @beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50)
    @zappa = Artist.create(name: 'Frank Zappa', still_recording: false, number_of_singles: 60)
  end

  it 'displays a list of all artists' do
    visit '/artists'

    expect(page).to have_content('The Beatles')
    expect(page).to have_content('Frank Zappa')
  end
end