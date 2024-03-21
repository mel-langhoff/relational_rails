require 'rails_helper'

RSpec.describe Artist, type: :model do
  before :each do
    @beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50, created_at: Time.now)
    @zappa = Artist.create(name: 'Frank Zappa', still_recording: false, number_of_singles: 60, created_at: Time.now - 1.day)
  
    @help = Album.create(title: 'Help', on_vinyl: true, number_of_tracks: 10, artist_id: @beatles.id)
    @abbey = Album.create(title: 'Abbey Road', on_vinyl: false, number_of_tracks: 12, artist_id: @beatles.id)
    @white = Album.create(title: 'The White Album', on_vinyl: true, number_of_tracks: 20, artist_id: @beatles.id)
  end

  describe 'relationships' do
    it { should have_many :albums }
  end

  it '#most_recently_created' do
    expect(Artist.most_recently_created).to eq([@beatles, @zappa])
  end

  it '#album_count' do
    expect(@beatles.album_count).to eq(3)
  end
end