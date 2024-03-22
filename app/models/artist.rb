class Artist < ApplicationRecord
  has_many :albums

  def self.most_recently_created
    order(created_at: :desc)
  end

  def album_count
    albums.count
  end

  def self.sort_by_album_number
    joins(:albums)
    .group('artists.id')
    .order('COUNT(albums.id) DESC')
  end
end