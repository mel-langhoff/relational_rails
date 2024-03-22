require 'rails_helper'

RSpec.describe Album do 
  before :each do
    @beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50)
    @help = Album.create(title: 'Help', on_vinyl: true, number_of_tracks: 10, artist_id: @beatles.id)
    @abbey = Album.create(title: 'Abbey Road', on_vinyl: false, number_of_tracks: 12, artist_id: @beatles.id)
    @white = Album.create(title: 'The White Album', on_vinyl: true, number_of_tracks: 20, artist_id: @beatles.id)
  end

  describe 'relationships' do
    it { should belong_to :artist }
  end

  it "#only_true" do
    vinyl_albums = Album.only_true
    expect(vinyl_albums).to include(@help)
    expect(vinyl_albums).to include(@white)
    expect(vinyl_albums).not_to include(@abbey)
  end
end