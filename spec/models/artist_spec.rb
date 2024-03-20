require 'rails_helper'

RSpec.describe Artist, type: :model do
  before :each do
    @beatles = Artist.create(name: 'The Beatles', still_recording: false, number_of_singles: 50, created_at: Time.now)
    @zappa = Artist.create(name: 'Frank Zappa', still_recording: false, number_of_singles: 60, created_at: Time.now - 1.day)
  end

  it "#most_recently_created" do
    expect(Artist.most_recently_created).to eq([@beatles, @zappa])
  end
end